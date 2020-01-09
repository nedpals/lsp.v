module lsp

type DocumentUri string

pub struct NotificationMessage {
    method string
    params string [raw]
}

// // method: $/cancelRequest
pub struct CancelParams {
    id int
}

pub struct Command {
	title string
	command string
	arguments []string
}