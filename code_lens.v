module lsp

// method: ‘textDocument/codeLens’
// response: []CodeLens | none
pub struct CodeLensParams {
	text_document TextDocumentIdentifier [json:textDocument]
}

pub struct CodeLens {
	range Range
	command Command
	data string [raw]
}

pub struct CodeLensRegistrationOptions {
	document_selector DocumentSelector [json:documentSelector]
	resolve_provider bool [json:resolveProvider]
}

// method: ‘codeLens/resolve’
// response: CodeLens
// request: CodeLens