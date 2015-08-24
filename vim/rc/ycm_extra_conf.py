# http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
# https://github.com/rasendubi/dotfiles/blob/d534c5fb6bf39f0d9c8668b564ab68b6e3a3eb78/.vim/.ycm_extra_conf.py
import os
import ycm_core
from clang_helpers import PrepareClangFlags

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

#node_root='/Volumes/d/dev/js/io.js/'
node_root='/Volumes/d/dev/ns/nsolid/nsolid-node/'
uv_root='/Volumes/d/dev/js/libuv/'
# These are the compilation flags that will be used in case there's no
# compilation database set.
flags = [
  '-Wall',
  '-Wextra',
  '-Werror',
  '-Wno-long-long',
  '-Wno-variadic-macros',
  '-Wno-unused-parameter',
  '-fexceptions',
  # THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
  # language to use when compiling headers. So it will guess. Badly. So C++
  # headers will be compiled as C headers. You don't want that so ALWAYS specify
  # a "-std=<something>".
  # and the same thing goes for the magic -x option which specifies the
  # language that the files to be compiled are written in. This is mostly
  # relevant for c++ headers.
  # 'c++11'.

  # C++ project
  '-std=c++11', '-x', 'c++',

  # C project
  # '-Wc++98-compat', '-std=c99', '-x', 'c',

  # Includes for OSX, obtained via: echo | clang -v -E -x c++
  # @see: https://github.com/Valloric/YouCompleteMe#completion-doesnt-work-with-the-c-standard-library-headers
  '-isystem', '/System/Library/Frameworks/Python.framework/Headers',
  '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
  '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include',
  '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
  '-isystem', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include',
  '-isystem', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks',
  '-I', '/usr/local/include',
  '-I', 'include/',
  '-I', 'src/',
  # '-I', uv_root + 'include/',
  # '-I', uv_root + 'src/',
  '-I', node_root + 'src/',
  '-I', node_root + 'deps/v8',
  '-I', node_root + 'deps/v8/include',
  '-I', node_root + 'deps/uv/include',
  '-I', node_root + 'deps/uv/src',
  '-I', node_root + 'nsolid/deps/cjson',
  '-I', node_root + 'nsolid/src/',
  '-I', node_root + 'nsolid/deps/nan',
  '-I', node_root + 'out/Release/gen',
  '-I', node_root
]

if compilation_database_folder:
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None


def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return flags
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def FlagsForFile( filename ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = database.GetCompilationInfoForFile( filename )
    final_flags = PrepareClangFlags(
        MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_ ),
        filename )
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }
