_git_graph()
{
      # you can return anything here for the autocompletion for example all
      # the branches
      __gitcomp_nl "$(__git_refs)"
}
