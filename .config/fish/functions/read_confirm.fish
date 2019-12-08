function read_confirm
  while true
    read -l -P "$argv [y/n]: " confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end