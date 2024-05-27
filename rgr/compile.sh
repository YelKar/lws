for f in *.pas
do
  if find hash/$f > /dev/null && diff $f hash/$f
  then
    echo "$f not modified"
  else

    echo "Compiling $f"
    if fpc $f
    then
      cp $f hash/$f
    else
      return 1
    fi
    echo
  fi
done
