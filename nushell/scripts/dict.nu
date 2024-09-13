def dict [...word] {
	let query = ($word | str join %20)
  let link = ('https://api.dictionaryapi.dev/api/v2/entries/en/' + ($query|str replace ' ' '%20'))
  let output = (http get $link | rename word)
  let w = ($output.word | first)

  if $w == "No Definitions Found" {
  	echo $output.word
  } else {
  	echo $output
    | get meanings
    | flatten
    | select partOfSpeech definitions
    | flatten
    | flatten
    | reject "synonyms"
    | reject "antonyms"
  }
}
