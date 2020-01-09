module lsp

// method: ‘initialize’
// should be map[string]string
pub struct InitializeParams {
	process_id int [json:processId]
	root_uri string [json:rootUri]
	initialization_options UserInitializationOptions [json:initializationOptions]
	capabilities ClientCapabilities
	trace string
	workspace_folders []WorkspaceFolder [json:workspaceFolders]
}

struct InitializeResult {
	capabilities ServerCapabilities
}

enum InitializeErrorCode {
	unknownProtocolVersion = 1
}

struct InitializeError {
	retry bool
}

/**
 * The kind of resource operations supported by the client.
 */
enum ResourceOperationKind {
	create rename delete
}

enum FailureHandlingKind {
	abort transactional undo text_only_transactional
}

// /**
//  * Defines how the host (editor) should sync document changes to the language server.
//  */
// export namespace TextDocumentSyncKind {
// 	/**
// 	 * Documents should not be synced at all.
// 	 */
// 	export const None = 0;

// 	/**
// 	 * Documents are synced by always sending the full content
// 	 * of the document.
// 	 */
// 	export const Full = 1;

// 	/**
// 	 * Documents are synced by sending the full content on open.
// 	 * After that only incremental updates to the document are
// 	 * send.
// 	 */
// 	export const Incremental = 2;
// }

// /**
//  * Completion options.
//  */
// export interface CompletionOptions {
// 	/**
// 	 * The server provides support to resolve additional
// 	 * information for a completion item.
// 	 */
// 	resolveProvider?: boolean;

// 	/**
// 	 * The characters that trigger completion automatically.
// 	 */
// 	triggerCharacters?: string[];
// }
// /**
//  * Signature help options.
//  */
// export interface SignatureHelpOptions {
// 	/**
// 	 * The characters that trigger signature help
// 	 * automatically.
// 	 */
// 	triggerCharacters?: string[];
// }

// /**
//  * Code Action options.
//  */
// export interface CodeActionOptions {
// 	/**
// 	 * CodeActionKinds that this server may return.
// 	 *
// 	 * The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
// 	 * may list out every specific kind they provide.
// 	 */
// 	codeActionKinds?: CodeActionKind[];
// }

// /**
//  * Code Lens options.
//  */
// export interface CodeLensOptions {
// 	/**
// 	 * Code lens has a resolve provider as well.
// 	 */
// 	resolveProvider?: boolean;
// }

// /**
//  * Format document on type options.
//  */
// export interface DocumentOnTypeFormattingOptions {
// 	/**
// 	 * A character on which formatting should be triggered, like `}`.
// 	 */
// 	firstTriggerCharacter: string;

// 	/**
// 	 * More trigger characters.
// 	 */
// 	moreTriggerCharacter?: string[];
// }

// /**
//  * Rename options
//  */
// export interface RenameOptions {
// 	/**
// 	 * Renames should be checked and tested before being executed.
// 	 */
// 	prepareProvider?: boolean;
// }

// /**
//  * Document link options.
//  */
// export interface DocumentLinkOptions {
// 	/**
// 	 * Document links have a resolve provider as well.
// 	 */
// 	resolveProvider?: boolean;
// }

// /**
//  * Execute command options.
//  */
// export interface ExecuteCommandOptions {
// 	/**
// 	 * The commands to be executed on the server
// 	 */
// 	commands: string[]
// }

// /**
//  * Save options.
//  */
// export interface SaveOptions {
// 	/**
// 	 * The client is supposed to include the content on save.
// 	 */
// 	includeText?: boolean;
// }

// /**
//  * Color provider options.
//  */
// export interface ColorProviderOptions {
// }

// /**
//  * Folding range provider options.
//  */
// export interface FoldingRangeProviderOptions {
// }

// export interface TextDocumentSyncOptions {
// 	/**
// 	 * Open and close notifications are sent to the server. If omitted open close notification should not
// 	 * be sent.
// 	 */
// 	openClose?: boolean;
// 	/**
// 	 * Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
// 	 * and TextDocumentSyncKind.Incremental. If omitted it defaults to TextDocumentSyncKind.None.
// 	 */
// 	change?: number;
// 	/**
// 	 * If present will save notifications are sent to the server. If omitted the notification should not be
// 	 * sent.
// 	 */
// 	willSave?: boolean;
// 	/**
// 	 * If present will save wait until requests are sent to the server. If omitted the request should not be
// 	 * sent.
// 	 */
// 	willSaveWaitUntil?: boolean;
// 	/**
// 	 * If present save notifications are sent to the server. If omitted the notification should not be
// 	 * sent.
// 	 */
// 	save?: SaveOptions;
// }

// /**
//  * Static registration options to be returned in the initialize request.
//  */
// interface StaticRegistrationOptions {
// 	/**
// 	 * The id used to register the request. The id can be used to deregister
// 	 * the request again. See also Registration#id.
// 	 */
// 	id?: string;
// }

// interface ServerCapabilities {
// 	/**
// 	 * Defines how text documents are synced. Is either a detailed structure defining each notification or
// 	 * for backwards compatibility the TextDocumentSyncKind number. If omitted it defaults to `TextDocumentSyncKind.None`.
// 	 */
// 	textDocumentSync?: TextDocumentSyncOptions | number;
// 	/**
// 	 * The server provides hover support.
// 	 */
// 	hoverProvider?: boolean;
// 	/**
// 	 * The server provides completion support.
// 	 */
// 	completionProvider?: CompletionOptions;
// 	/**
// 	 * The server provides signature help support.
// 	 */
// 	signatureHelpProvider?: SignatureHelpOptions;
// 	/**
// 	 * The server provides goto definition support.
// 	 */
// 	definitionProvider?: boolean;
// 	/**
// 	 * The server provides Goto Type Definition support.
// 	 *
// 	 * Since 3.6.0
// 	 */
// 	typeDefinitionProvider?: boolean | (TextDocumentRegistrationOptions & StaticRegistrationOptions);
// 	/**
// 	 * The server provides Goto Implementation support.
// 	 *
// 	 * Since 3.6.0
// 	 */
// 	implementationProvider?: boolean | (TextDocumentRegistrationOptions & StaticRegistrationOptions);
// 	/**
// 	 * The server provides find references support.
// 	 */
// 	referencesProvider?: boolean;
// 	/**
// 	 * The server provides document highlight support.
// 	 */
// 	documentHighlightProvider?: boolean;
// 	/**
// 	 * The server provides document symbol support.
// 	 */
// 	documentSymbolProvider?: boolean;
// 	/**
// 	 * The server provides workspace symbol support.
// 	 */
// 	workspaceSymbolProvider?: boolean;
// 	/**
// 	 * The server provides code actions. The `CodeActionOptions` return type is only
// 	 * valid if the client signals code action literal support via the property
// 	 * `textDocument.codeAction.codeActionLiteralSupport`.
// 	 */
// 	codeActionProvider?: boolean | CodeActionOptions;
// 	/**
// 	 * The server provides code lens.
// 	 */
// 	codeLensProvider?: CodeLensOptions;
// 	/**
// 	 * The server provides document formatting.
// 	 */
// 	documentFormattingProvider?: boolean;
// 	/**
// 	 * The server provides document range formatting.
// 	 */
// 	documentRangeFormattingProvider?: boolean;
// 	/**
// 	 * The server provides document formatting on typing.
// 	 */
// 	documentOnTypeFormattingProvider?: DocumentOnTypeFormattingOptions;
// 	/**
// 	 * The server provides rename support. RenameOptions may only be
// 	 * specified if the client states that it supports
// 	 * `prepareSupport` in its initial `initialize` request.
// 	 */
// 	renameProvider?: boolean | RenameOptions;
// 	/**
// 	 * The server provides document link support.
// 	 */
// 	documentLinkProvider?: DocumentLinkOptions;
// 	/**
// 	 * The server provides color provider support.
// 	 *
// 	 * Since 3.6.0
// 	 */
// 	colorProvider?: boolean | ColorProviderOptions | (ColorProviderOptions & TextDocumentRegistrationOptions & StaticRegistrationOptions);
// 	/**
// 	 * The server provides folding provider support.
// 	 *
// 	 * Since 3.10.0
// 	 */
// 	foldingRangeProvider?: boolean | FoldingRangeProviderOptions | (FoldingRangeProviderOptions & TextDocumentRegistrationOptions & StaticRegistrationOptions);
// 	/**
// 	 * The server provides go to declaration support.
// 	 *
// 	 * Since 3.14.0
// 	 */
// 	declarationProvider?: boolean | (TextDocumentRegistrationOptions & StaticRegistrationOptions);
// 	/**
// 	 * The server provides execute command support.
// 	 */
// 	executeCommandProvider?: ExecuteCommandOptions;
// 	/**
// 	 * Workspace specific server capabilities
// 	 */
// 	workspace?: {
// 		/**
// 		 * The server supports workspace folder.
// 		 *
// 		 * Since 3.6.0
// 		 */
// 		workspaceFolders?: {
// 			/**
// 			* The server has support for workspace folders
// 			*/
// 			supported?: boolean;
// 			/**
// 			* Whether the server wants to receive workspace folder
// 			* change notifications.
// 			*
// 			* If a strings is provided the string is treated as a ID
// 			* under which the notification is registered on the client
// 			* side. The ID can be used to unregister for these events
// 			* using the `client/unregisterCapability` request.
// 			*/
// 			changeNotifications?: string | boolean;
// 		}
// 	}
// 	/**
// 	 * Experimental server capabilities.
// 	 */
// 	experimental?: any;
// }