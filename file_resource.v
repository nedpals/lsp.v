module lsp

pub struct CreateFileOptions {
	overwrite      bool
	ignoreIfExists bool
}

pub struct CreateFile {
	kind    string // 'create'
	uri     string
	options CreateFileOptions
}

pub struct RenameFileOptions {
	overwrite      bool
	ignoreIfExists bool
}

pub struct RenameFile {
	kind    string // 'rename'
	old_uri string [json:oldUri]
	new_uri string [json:newUri]
	options RenameFileOptions
}

pub struct DeleteFileOptions {
	recursive      bool
	ignoreIfExists bool
}

pub struct DeleteFile {
	kind    string // 'delete'
	uri     string
	options DeleteFileOptions
}
