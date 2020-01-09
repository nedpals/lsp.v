# LSP.V
Implementation of the Language Server Protocol spec on V. For use on the [VLS](https://github.com/nedpals/vls) language server.

## Roadmap
### General
- [-] `initialize` (missing capability options structs)
- [-] `initialized`
- [x] `shutdown`
- [x] `exit`
- [x] `$/cancelRequest`
### Window
- [x] `showMessage`
- [x] `showMessageRequest`
- [x] `logMessage`
### Telemetry
- [x] `event`
### Client
- [x] `registerCapability`
- [x] `unregisterCapability`
### Workspace
- [x] `workspaceFolders`
- [x] `didChangeWorkspaceFolder`
- [x] `didChangeConfiguration`
- [x] `configuration`
- [x] `didChangeWatchedFiles`
- [x] `symbol`
- [x] `executeCommand`
- [x] `applyEdit`
### Text Synchronization
- [x] `didOpen`
- [x] `didChange`
- [x] `willSave`
- [x] `willSaveWaitUntil`
- [x] `didSave`
- [x] `didClose`
### Diagnostics
- [x] `publishDiagnostics`
### Language Features
- [ ] `completion`
- [ ] `completion resolve`
- [ ] `hover`
- [ ] `signatureHelp`
- [ ] `declaration`
- [ ] `definition`
- [ ] `typeDefinition`
- [ ] `implementation`
- [ ] `references`
- [ ] `documentHighlight`
- [ ] `documentSymbol`
- [ ] `codeAction`
- [ ] `codeLens`
- [ ] `codeLens resolve`
- [ ] `documentLink`
- [ ] `documentLink resolve`
- [ ] `documentColor`
- [ ] `colorPresentation`
- [ ] `formatting`
- [ ] `rangeFormatting`
- [ ] `onTypeFormatting`
- [ ] `rename`
- [ ] `prepareRename`
- [ ] `foldingRange`
    
    
## OTHER TODO
- Transfer structs and enums on `structs.v` to its appropriate designated files.

#### 2020 Ned Palacios