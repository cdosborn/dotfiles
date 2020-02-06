function debug#InsertDebugStatement()
  let debug = "debugger;"  | " default because it works for ruby & javascript

  if (&filetype == "python")
    let debug = "import ipdb; ipdb.set_trace()"
  endif

  exec ":normal O" . debug
  exec ":write"
endfunction

function debug#InsertPrintStatementOverSelection()
  let debug = "debugger"  | " default because it works for ruby & javascript

  if (&filetype == "python")
    let debug = "import ipdb; ipdb.set_trace()"
  endif

  exec ":normal O" . debug
  exec ":write"
endfunction
