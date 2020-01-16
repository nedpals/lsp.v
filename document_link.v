module lsp

pub struct DocumentLinkOptions {
	resolve_provider bool [json:resolveProvider]
}

// method: ‘textDocument/documentLink’
// response: []DocumentLink | none
pub struct DocumentLinkParams {
	text_document TextDocumentIdentifier [json:textDocument]
}

pub struct DocumentLink {
	range  Range
	target string
	data   string [raw]
}

pub struct DocumentLinkRegistrationOptions {
	document_selector DocumentSelector [json:documentSelector]
	resolve_provider  bool             [json:resolveProvider]
}

// method: ‘documentLink/resolve’
// response: DocumentLink
// request: DocumentLink
