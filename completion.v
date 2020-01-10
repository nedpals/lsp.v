module lsp

pub struct CompletionOptions {
	resolve_provider bool [json:resolveProvider]
	trigger_characters []string [json:triggerCharacters]
}

pub struct CompletionItemKindSettings {
	value_set []CompletionItemKind [json:valueSet]
}

pub struct CompletionItemSettings {
	snippet_support bool [json:snippetSupport]
	commit_characters_support bool [json:commitCharactersSupport]
	documentation_format bool [json:documentationFormat]
	preselect_support bool [json:preselectSupport]
}

// method: ‘textDocument/completion’
// response: []CompletionItem | CompletionList | none
pub struct CompletionParams {
	// extend: TextDocumentPositionParams
	context CompletionContext
}

pub const (
	Invoked = 1
	TriggerCharacter = 2
	TriggerForIncompleteCompletions = 3
)

pub struct CompletionContext {
	trigger_kind CompletionTriggerKind [json:triggerKind]
	trigger_character string [json:triggerCharacter]
}

pub struct CompletionList {
	is_incomplete bool [json:isIncomplete]
	items []CompletionItem
}

pub const (
	PlainText = 1
	Snippet = 2
)

pub struct CompletionItem {
	label string
	kind int
	detail string
	// documentation string | MarkupContent
	documentation string [raw]
	deprecated bool
	preselect bool
	sort_text string [json:sortText]
	filter_text string [json:filterText]
	insert_text string [json:insertText]
	text_edit TextEdit [json:textEdit]
	additional_text_edits []TextEdit [json:additionalTextEdits]
	commit_characters []string [json:commitCharacters]
	command Command
	data string [raw]
}

pub enum CompletionItemKind {
	text = 1
	method = 2
	function = 3
	constructor = 4
	field = 5
	variable = 6
	class = 7
	@interface = 8
	@module = 9
	property = 10
	unit = 11
	value = 12
	@enum = 13
	keyword = 14
	snippet = 15
	color = 16
	file = 17
	reference = 18
	folder = 19
	enum_member = 20
	constant = 21
	@struct = 22
	event = 23
	operator = 24
	type_parameter = 25
}

pub struct CompletionRegistrationOptions {
	document_selector DocumentSelector [json:documentSelector]
	trigger_characters []string [json:triggerCharacters]
	all_commit_characters []string [json:allCommitCharacters]
	resolve_provider bool [json:resolveProvider]
}

// method: ‘completionItem/resolve’
// response: CompletionItem
// request: CompletionItem