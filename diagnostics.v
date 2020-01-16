module lsp

pub struct Diagnostic {
	range    Range
	severity int
	code     string
	source   string
	message  string
	related_information []DiagnosticRelatedInformation [json:relatedInformation]
}

pub enum DiagnosticSeverity {
	error       = 1
	warning     = 2
	information = 3
	hint        = 4
}

pub struct DiagnosticRelatedInformation {
	location Location
	message  string
}

// method: ‘textDocument/publishDiagnostics’
pub struct PublishDiagnosticsParams {
	uri         string
	diagnostics []Diagnostic
}
