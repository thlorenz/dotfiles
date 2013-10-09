function runc () {
  make $1 && ./$1 && rm ./$1
}
