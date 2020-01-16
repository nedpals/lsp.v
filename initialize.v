module lsp

// method: ‘initialize’
// response: InitializeResult
// notes: should be map[string]string
pub struct InitializeParams {
	process_id             int [json:processId]
	root_uri               string [json:rootUri]
	initialization_options UserInitializationOptions [json:initializationOptions]
	capabilities           ClientCapabilities
	trace                  string
	workspace_folders      []WorkspaceFolder [json:workspaceFolders]
}

pub struct InitializeResult {
	capabilities ServerCapabilities
}

// method: ‘initialized’
// notification
// pub struct InitializedParams {}

pub enum InitializeErrorCode {
	unknownProtocolVersion = 1
}

pub struct InitializeError {
	retry bool
}

/**
 * The kind of resource operations supported by the client.
 */
pub enum ResourceOperationKind {
	create rename delete
}

pub enum FailureHandlingKind {
	abort transactional undo text_only_transactional
}

// TextDocumentSyncKind
pub const (
	None        = 0
	Full        = 1
	Incremental = 2
)

pub struct ExecuteCommandOptions {
	commands []string
}

pub struct StaticRegistrationOptions {
	id string
}

// method: ‘shutdown’
// response: none

// method: ‘exit’
// response: none
