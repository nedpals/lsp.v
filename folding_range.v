module lsp

// method: ‘textDocument/foldingRange’
// response: []FoldingRange | none
pub struct FoldingRangeParams {
	text_document TextDocumentIdentifier [json:textDocument]
}

pub enum FoldingRangeKind {
	comment = 'comment'
	imports = 'imports'
	region = 'region'
}

pub struct FoldingRange {
	start_line int [json:startLine]
	start_character int [json:startCharacter]
	end_line int [json:endLine]
	end_character int [json:endCharacter]
	kind string
}

