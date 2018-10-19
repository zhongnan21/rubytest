class C8
  # Sample code from Programing Ruby, page 109
  def prompt_and_get(prompt)
    print prompt
    res = readline.chomp
    throw :quit_requested, "done" if res == "!"
    res
  end

end
catch :quit_requested do
  c8 = C8.new
  name = c8.prompt_and_get("Name: ")
  age  = c8.prompt_and_get("Age:  ")
  sex  = c8.prompt_and_get("Sex:  ")
  # ..
  # process information
end
