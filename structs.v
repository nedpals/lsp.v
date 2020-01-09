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


// struct HoverSettings {
// 	dynamic_registration bool [json:dynamicRegistration]
// 	content_format []MarkupKind [json:contentFormat]
// }

struct CompletionItemKindSettings {
	value_set []CompletionItemKind [json:valueSet]
}

struct CompletionItemSettings {
	snippet_support bool [json:snippetSupport]
	commit_characters_support bool [json:commitCharactersSupport]
	documentation_format bool [json:documentationFormat]
	preselect_support bool [json:preselectSupport]
}

enum CompletionItemKind {
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

enum SymbolKind {
	file = 1
	@module = 2
	namespace = 3
	package = 4
	class = 5
	method = 6
	property = 7
	field = 8
	constructor = 9
	@enum = 10
	@interface = 11
	function = 12
	variable = 13
	constant = 14
	string = 15
	number = 16
	boolean = 17
	array = 18
	object = 19
	key = 20
	null = 21
	enum_member = 22
	@struct = 23
	event = 24
	operator = 25
	type_parameter = 26
}

