module lsp

// method: ‘textDocument/documentHighlight’
// response: []DocumentHighlight | none
// request: TextDocumentPositionParams

pub struct DocumentHighlight {
	range Range
	kind  int
}

pub const DocumentHighlightKind {
// pub const
	text = 1
	read = 2
	write = 3
}
