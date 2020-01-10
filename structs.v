module main



struct DocumentFilter {
	language string
	scheme string
	pattern string
}

type DocumentSelector = []DocumentFilter

struct TextDocumentRegistrationOptions {
	document_selector DocumentSelector [json:documentSelector]
}