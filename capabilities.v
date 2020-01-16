module lsp

pub struct WorkspaceClientCapabilities {
	apply_edit               bool          [json:applyEdit]
	workspace_edit           WorkspaceEdit [json:workspaceEdit]
	did_change_configuration DidChange     [json:didChangeConfiguration]
	did_change_watched_files DidChange     [json:didChangeWatchedFiles]
	execute_command          DidChange     [json:executeCommand]
	workspace_folders        bool          [json:workspaceFolders]
	configuration            bool
}

pub struct WorkspaceSymbol {
	dynamic_registration bool                [json:dynamicRegistration]
	symbol_kind          WorkspaceSymbolKind [json:symbolKind]
}

pub struct WorkspaceSymbolKind {
	value_set []SymbolKind [json:valueSet]
}

pub struct DidChange {
	dynamic_registration bool [json:dynamicRegistration]
}

pub struct TextDocumentClientCapabilities {
	synchronization     TextDocumentSyncCapability
	completion          CompletionCapability
	hover               HoverCapability
	signature_help      SignatureHelpCapability
	references          Capability
	document_highlight  Capability                  [json:documentHighlight]
	document_symbol     DocumentSymbolCapability    [json:documentSymbol]
	formatting          Capability
	range_formatting    Capability                  [json:rangeFormatting]
	on_type_formatting  Capability                  [json:on_type_formatting]
	declaration         LinkCapability
	definition          LinkCapability
	type_definition     LinkCapability              [json:typeDefinition]
	implementation      LinkCapability
	code_lens           Capability                  [json:codeLens]
	document_link       Capability                  [json:documentLink]
	color_provider      Capability                  [json:colorProvider]
	rename              RenameCapability
	publish_diagnostics PublishDiagnosticCapability [json:publishDiagnostics]
	folding_range       FoldingRangeCapability      [json:foldingRange]
}

pub struct TextDocumentSyncCapability {
	dynamic_registration bool [json:dynamicRegistration]
	will_save            bool [json:willSave]
	will_save_wait_until bool [json:willSaveWaitUntil]
	did_save             bool [json:didSave]
}

pub struct CompletionCapability {
	dynamic_registration bool                       [json:dynamicRegistration ]
	completion_item      CompletionItemSettings     [json:completionItem]
	completion_item_kind CompletionItemKindSettings [json:completionItemKind]
	context_support      bool                       [json:contextSupport]
} 

pub struct HoverCapability {
	dynamic_registration bool         [json:dynamicRegistration]
	content_format       []MarkupKind [json:contentFormat]
}

pub struct SignatureHelpCapability {
	dynamic_registration  bool                 [json:dynamicRegistration]
	signature_information SignatureInformation [json:signatureInformation]
}

pub struct SignatureInformation {
	document_format       []MarkupKind [json:documentFormat]
	parameter_information ParamsInfo [json:parameterInformation]
}

pub struct ParamsInfo {
	label_offset_support bool [json:labelOffsetSupport]
}

pub struct Capability {
	dynamic_registration bool [json:dynamicRegistration]
}

pub struct DocumentSymbolCapability {
	dynamic_registration                 bool               [json:dynamicRegistration]
	symbol_kind                          DocumentSymbolKind [json:symbolKind]
	hierarchical_document_symbol_support bool               [json:hierarchicalDocumentSymbolSupport]
}

pub struct DocumentSymbolKind {
	value_set []SymbolKind [json:valueSet]
}

pub struct LinkCapability {
	dynamic_registration bool [json:dynamicRegistration]
	link_support         bool [json:linkSupport]
}

pub struct CodeActionCapability {
	dynamic_registration        bool                     [json:dynamicRegistration]
	code_action_literal_support CodeActionLiteralSupport [json:codeActionLiteralSupport]
}

pub struct CodeActionLiteralSupport {
	code_action_kind CodeActionKindF [json:codeActionKind]
}

pub struct CodeActionKindF {
	value_set []CodeActionKind
}	

pub struct RenameCapability {
	dynamic_registration bool [json:dynamicRegistration]
	prepare_support      bool [json:prepareSupport]
}

pub struct PublishDiagnosticCapability {
	related_information bool [json:relatedInformation]
}

pub struct FoldingRangeCapability {
	dynamic_registration bool [json:dynamicRegistration]
	range_limit          int  [json:rangeLimit]
	line_folding_only    bool [json:lineFoldingOnly]
}

pub struct ClientCapabilities {
	workspace     WorkspaceClientCapabilities
	text_document TextDocumentClientCapabilities [json:textDocument]
	experimental  string [raw]
}

pub struct ServerCapabilities {
	text_document_sync                   int                             [json:textDocumentSync]
	hover_provider                       bool                            [json:hoverProvider]
	completion_provider                  CompletionOptions               [json:completionProvider]
	signature_help_provider              SignatureHelpOptions            [json:signatureHelpProvider]
	definition_provider                  bool                            [json:definitionProvider]
	type_definition_provider             bool                            [json:typeDefinitionProvider]
	implementation_provider              bool                            [json:implementationProvider]
	references_provider                  bool                            [json:referencesProvider]
	document_highlight_provider          bool                            [json:documentHightlightProvider]
	document_symbol_provider             bool                            [json:documentSymbolProvider]
	workspace_symbol_provider            bool                            [json:workspaceSymbolProvider]
	code_action_provider                 bool                            [json:codeActionProvider]
	code_lens_provider                   CodeLensOptions                 [json:codeLensProvider]
	document_formatting_provider         bool                            [json:documentFormattingProvider]
	document_on_type_formatting_provider DocumentOnTypeFormattingOptions [json:documentOnTypeFormattingProvider]
	rename_provider                      bool                            [json:renameProvider]
	document_link_provider               bool                            [json:documentLinkProvider]
	color_provider                       bool                            [json:colorProvider]
	declaration_provider                 bool                            [json:declarationProvider]
	execute_command_provder              ExecuteCommandProvider          [json:executeCommandProvider]
	experimental                         map                             [string]bool
}

pub struct ServerCapabilitiesWorkspace {
	workspace_folders WorkspaceFoldersProviderSupport [json:WorkspaceFoldersProviderSupport]
}

pub struct WorkspaceFoldersProviderSupport {
	supported            boolean
	change_notifications string [json:changeNotifications]
}
