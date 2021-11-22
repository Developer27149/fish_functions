function ghome
  set -l homepage_url (command git remote --verbose 2> /dev/null | grep fetch | command cut -c 8-)
  if [ $status -gt 0 ]
    echo 'Not a git repo'
    return 1
  end

  if [ -z $homepage_url ]
    echo 'Not a git repo'
    return 1
  end

  if [ -z (echo $homepage_url | grep github) ]
    echo 'Not a git repo...'
    return 2
  end
  # get branch name
  set -l branch (command git rev-parse --abbrev-ref HEAD)

  set -l url (string replace -r '\.git.*' '' $homepage_url)
  open $url/tree/$branch
end
