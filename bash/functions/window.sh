function st
{
  local title=$1
  echo -n -e "\033]0;$title\007"
}

function qt 
{
  local title="$(basename `pwd`)"
  echo -n -e "\033]0;$title\007"
}
