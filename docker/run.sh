#!/bin/bash -e 

user_alias=$(id -un)
image_cpu="mhe"

case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X not tested.'
     ;;

   Linux)
     repos_base_dir="$HOME/git/mhe"
     repos_mount_dir="/work/mhe"
     echo "Linux CPU devenv - assuming source is located in ${repos_base_dir}"

     docker run --rm -it \
     -v ${repos_base_dir}:${repos_mount_dir} \
     -w ${repos_mount_dir} \
     ${image_cpu} bash \
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW64*)
     repos_base_dir="c:\\Users\\$user_alias\\git\\mhe\\"
     repos_mount_dir="//work/mhe"
     echo "Windows CPU devenv - assuming source is located in ${repos_base_dir}"

    winpty docker.exe run --rm -it \
    -v ${repos_base_dir}:${repos_mount_dir} \
    -w ${repos_mount_dir} \
    ${image_cpu} bash \
     ;;

   *)
     echo 'other OS' 
     ;;
esac
