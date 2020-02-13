# bash completion for gh                                   -*- shell-script -*-

__gh_debug()
{
    if [[ -n ${BASH_COMP_DEBUG_FILE} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
    fi
}

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__gh_init_completion()
{
    COMPREPLY=()
    _get_comp_words_by_ref "$@" cur prev words cword
}

__gh_index_of_word()
{
    local w word=$1
    shift
    index=0
    for w in "$@"; do
        [[ $w = "$word" ]] && return
        index=$((index+1))
    done
    index=-1
}

__gh_contains_word()
{
    local w word=$1; shift
    for w in "$@"; do
        [[ $w = "$word" ]] && return
    done
    return 1
}

__gh_handle_reply()
{
    __gh_debug "${FUNCNAME[0]}"
    case $cur in
        -*)
            if [[ $(type -t compopt) = "builtin" ]]; then
                compopt -o nospace
            fi
            local allflags
            if [ ${#must_have_one_flag[@]} -ne 0 ]; then
                allflags=("${must_have_one_flag[@]}")
            else
                allflags=("${flags[*]} ${two_word_flags[*]}")
            fi
            COMPREPLY=( $(compgen -W "${allflags[*]}" -- "$cur") )
            if [[ $(type -t compopt) = "builtin" ]]; then
                [[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace
            fi

            # complete after --flag=abc
            if [[ $cur == *=* ]]; then
                if [[ $(type -t compopt) = "builtin" ]]; then
                    compopt +o nospace
                fi

                local index flag
                flag="${cur%=*}"
                __gh_index_of_word "${flag}" "${flags_with_completion[@]}"
                COMPREPLY=()
                if [[ ${index} -ge 0 ]]; then
                    PREFIX=""
                    cur="${cur#*=}"
                    ${flags_completion[${index}]}
                    if [ -n "${ZSH_VERSION}" ]; then
                        # zsh completion needs --flag= prefix
                        eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )"
                    fi
                fi
            fi
            return 0;
            ;;
    esac

    # check if we are handling a flag with special work handling
    local index
    __gh_index_of_word "${prev}" "${flags_with_completion[@]}"
    if [[ ${index} -ge 0 ]]; then
        ${flags_completion[${index}]}
        return
    fi

    # we are parsing a flag and don't have a special handler, no completion
    if [[ ${cur} != "${words[cword]}" ]]; then
        return
    fi

    local completions
    completions=("${commands[@]}")
    if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
        completions=("${must_have_one_noun[@]}")
    fi
    if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
        completions+=("${must_have_one_flag[@]}")
    fi
    COMPREPLY=( $(compgen -W "${completions[*]}" -- "$cur") )

    if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
        COMPREPLY=( $(compgen -W "${noun_aliases[*]}" -- "$cur") )
    fi

    if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
		if declare -F __gh_custom_func >/dev/null; then
			# try command name qualified custom func
			__gh_custom_func
		else
			# otherwise fall back to unqualified for compatibility
			declare -F __custom_func >/dev/null && __custom_func
		fi
    fi

    # available in bash-completion >= 2, not always present on macOS
    if declare -F __ltrim_colon_completions >/dev/null; then
        __ltrim_colon_completions "$cur"
    fi

    # If there is only 1 completion and it is a flag with an = it will be completed
    # but we don't want a space after the =
    if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
       compopt -o nospace
    fi
}

# The arguments should be in the form "ext1|ext2|extn"
__gh_handle_filename_extension_flag()
{
    local ext="$1"
    _filedir "@(${ext})"
}

__gh_handle_subdirs_in_dir_flag()
{
    local dir="$1"
    pushd "${dir}" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1
}

__gh_handle_flag()
{
    __gh_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    # if a command required a flag, and we found it, unset must_have_one_flag()
    local flagname=${words[c]}
    local flagvalue
    # if the word contained an =
    if [[ ${words[c]} == *"="* ]]; then
        flagvalue=${flagname#*=} # take in as flagvalue after the =
        flagname=${flagname%=*} # strip everything after the =
        flagname="${flagname}=" # but put the = back
    fi
    __gh_debug "${FUNCNAME[0]}: looking for ${flagname}"
    if __gh_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
        must_have_one_flag=()
    fi

    # if you set a flag which only applies to this command, don't show subcommands
    if __gh_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
      commands=()
    fi

    # keep flag value with flagname as flaghash
    # flaghash variable is an associative array which is only supported in bash > 3.
    if [[ -z "${BASH_VERSION}" || "${BASH_VERSINFO[0]}" -gt 3 ]]; then
        if [ -n "${flagvalue}" ] ; then
            flaghash[${flagname}]=${flagvalue}
        elif [ -n "${words[ $((c+1)) ]}" ] ; then
            flaghash[${flagname}]=${words[ $((c+1)) ]}
        else
            flaghash[${flagname}]="true" # pad "true" for bool flag
        fi
    fi

    # skip the argument to a two word flag
    if [[ ${words[c]} != *"="* ]] && __gh_contains_word "${words[c]}" "${two_word_flags[@]}"; then
			  __gh_debug "${FUNCNAME[0]}: found a flag ${words[c]}, skip the next argument"
        c=$((c+1))
        # if we are looking for a flags value, don't show commands
        if [[ $c -eq $cword ]]; then
            commands=()
        fi
    fi

    c=$((c+1))

}

__gh_handle_noun()
{
    __gh_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    if __gh_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
        must_have_one_noun=()
    elif __gh_contains_word "${words[c]}" "${noun_aliases[@]}"; then
        must_have_one_noun=()
    fi

    nouns+=("${words[c]}")
    c=$((c+1))
}

__gh_handle_command()
{
    __gh_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    local next_command
    if [[ -n ${last_command} ]]; then
        next_command="_${last_command}_${words[c]//:/__}"
    else
        if [[ $c -eq 0 ]]; then
            next_command="_gh_root_command"
        else
            next_command="_${words[c]//:/__}"
        fi
    fi
    c=$((c+1))
    __gh_debug "${FUNCNAME[0]}: looking for ${next_command}"
    declare -F "$next_command" >/dev/null && $next_command
}

__gh_handle_word()
{
    if [[ $c -ge $cword ]]; then
        __gh_handle_reply
        return
    fi
    __gh_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
    if [[ "${words[c]}" == -* ]]; then
        __gh_handle_flag
    elif __gh_contains_word "${words[c]}" "${commands[@]}"; then
        __gh_handle_command
    elif [[ $c -eq 0 ]]; then
        __gh_handle_command
    elif __gh_contains_word "${words[c]}" "${command_aliases[@]}"; then
        # aliashash variable is an associative array which is only supported in bash > 3.
        if [[ -z "${BASH_VERSION}" || "${BASH_VERSINFO[0]}" -gt 3 ]]; then
            words[c]=${aliashash[${words[c]}]}
            __gh_handle_command
        else
            __gh_handle_noun
        fi
    else
        __gh_handle_noun
    fi
    __gh_handle_word
}

_gh_issue_create()
{
    last_command="gh_issue_create"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--body=")
    two_word_flags+=("--body")
    two_word_flags+=("-b")
    local_nonpersistent_flags+=("--body=")
    flags+=("--title=")
    two_word_flags+=("--title")
    two_word_flags+=("-t")
    local_nonpersistent_flags+=("--title=")
    flags+=("--web")
    flags+=("-w")
    local_nonpersistent_flags+=("--web")
    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_issue_list()
{
    last_command="gh_issue_list"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--assignee=")
    two_word_flags+=("--assignee")
    two_word_flags+=("-a")
    local_nonpersistent_flags+=("--assignee=")
    flags+=("--label=")
    two_word_flags+=("--label")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--label=")
    flags+=("--limit=")
    two_word_flags+=("--limit")
    two_word_flags+=("-L")
    local_nonpersistent_flags+=("--limit=")
    flags+=("--state=")
    two_word_flags+=("--state")
    two_word_flags+=("-s")
    local_nonpersistent_flags+=("--state=")
    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_issue_status()
{
    last_command="gh_issue_status"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_issue_view()
{
    last_command="gh_issue_view"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--preview")
    flags+=("-p")
    local_nonpersistent_flags+=("--preview")
    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_issue()
{
    last_command="gh_issue"

    command_aliases=()

    commands=()
    commands+=("create")
    commands+=("list")
    commands+=("status")
    commands+=("view")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_pr_checkout()
{
    last_command="gh_pr_checkout"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_pr_create()
{
    last_command="gh_pr_create"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--base=")
    two_word_flags+=("--base")
    two_word_flags+=("-B")
    local_nonpersistent_flags+=("--base=")
    flags+=("--body=")
    two_word_flags+=("--body")
    two_word_flags+=("-b")
    local_nonpersistent_flags+=("--body=")
    flags+=("--draft")
    flags+=("-d")
    local_nonpersistent_flags+=("--draft")
    flags+=("--title=")
    two_word_flags+=("--title")
    two_word_flags+=("-t")
    local_nonpersistent_flags+=("--title=")
    flags+=("--web")
    flags+=("-w")
    local_nonpersistent_flags+=("--web")
    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_pr_list()
{
    last_command="gh_pr_list"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--assignee=")
    two_word_flags+=("--assignee")
    two_word_flags+=("-a")
    local_nonpersistent_flags+=("--assignee=")
    flags+=("--base=")
    two_word_flags+=("--base")
    two_word_flags+=("-B")
    local_nonpersistent_flags+=("--base=")
    flags+=("--label=")
    two_word_flags+=("--label")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--label=")
    flags+=("--limit=")
    two_word_flags+=("--limit")
    two_word_flags+=("-L")
    local_nonpersistent_flags+=("--limit=")
    flags+=("--state=")
    two_word_flags+=("--state")
    two_word_flags+=("-s")
    local_nonpersistent_flags+=("--state=")
    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_pr_status()
{
    last_command="gh_pr_status"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_pr_view()
{
    last_command="gh_pr_view"

    command_aliases=()

    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--preview")
    flags+=("-p")
    local_nonpersistent_flags+=("--preview")
    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_pr()
{
    last_command="gh_pr"

    command_aliases=()

    commands=()
    commands+=("checkout")
    commands+=("create")
    commands+=("list")
    commands+=("status")
    commands+=("view")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_gh_root_command()
{
    last_command="gh"

    command_aliases=()

    commands=()
    commands+=("issue")
    commands+=("pr")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("--repo=")
    two_word_flags+=("--repo")
    two_word_flags+=("-R")
    flags+=("--version")
    local_nonpersistent_flags+=("--version")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

__start_gh()
{
    local cur prev words cword
    declare -A flaghash 2>/dev/null || :
    declare -A aliashash 2>/dev/null || :
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion -s || return
    else
        __gh_init_completion -n "=" || return
    fi

    local c=0
    local flags=()
    local two_word_flags=()
    local local_nonpersistent_flags=()
    local flags_with_completion=()
    local flags_completion=()
    local commands=("gh")
    local must_have_one_flag=()
    local must_have_one_noun=()
    local last_command
    local nouns=()

    __gh_handle_word
}

if [[ $(type -t compopt) = "builtin" ]]; then
    complete -o default -F __start_gh gh
else
    complete -o default -o nospace -F __start_gh gh
fi

# ex: ts=4 sw=4 et filetype=sh
