module lsp

import math

// @type DocumentUri string

pub struct Position {
    line int
    character int
}

pub struct Range {
    start Position
    end Position
}

pub struct TextEdit {
	range Range
	new_text string
}

// struct TextDocumentEdit {
// 	text_document Ve
// }

pub struct LocationLink {
	origin_selection_range Range [json:originSelectionRange]
	target_uri string [json:targetUri]
	target_range Range [json:targetRange]
	target_selection_range Range [json:targetSelectionRange]
}

pub struct TextDocumentContentChangeEvent {
	range Range
	text string
}

pub struct TextDocument {
	uri DocumentUri
	language_id string
	version int
	line_count int
}

pub struct FullTextDocument {
	uri DocumentUri
	language_id string
	version int
	content string
	line_offsets []int
}

fn get_wellformed_range(range Range) Range {
	const start = range.start
	const end = range.end
	if (start.line > end.line || (start.line == end.line && start.character > end.character)) {
		return Range{end, start }
	}
	return range
}

fn compute_line_offsets(text string, is_at_line_start boolean, text_offset int) []int {
	result := if is_at_line_start { [text_offset] } else { []int }

	for i, char in text {
		if char.is_white() {
			if char.is_white() && (i+1 < text.len && text[i+1].is_white()) {
				i++
			}

			result.push(text_offset + i + 1)
		}
	}

	return result
}

fn new_text_document(uri string, language_id string, version int) TextDocument {
	return TextDocument{DocumentUri(uri),language_id,version}
}

fn new_full_text_document(uri string, language_id string, version int, content string) FullTextDocument {
	return FullTextDocument{DocumentUri(uri),language_id,version,content.[]int}
}

fn (doc FullTextDocument) get_text(range Range) string {
	if range.start.line != -1 && range.end.line != -1 {
		start := doc.offset_at(range.start)
		end := doc.offset_at(range.end)

		return doc.content[start..end]
	}

	return doc.content
}

fn (doc FullTextDocument) is_incremental(event TextDocumentContentChangeEvent) bool {
	return (event.range.start.line != -1 || event.range.end.line != -1)
}

fn (doc mut FullTextDocument) update(changes []TextDocumentContentChangeEvent, version int) {
	for change of changes {
		if doc.is_incremental(change) {
			range := get_wellformed_range(change.range)

			// update content
			start_offset := doc.offset_at(range.start)
			end_offset := doc.offset_at(range.end)
			doc.content = doc.content[0..start_offset] + change.text + doc.content[end_offset..]

			// update offsets
			start_line := math.max(range.start.line, 0)
			end_line := math.max(range.end.line, 0)
			line_offsets = doc.line_offsets
			added_line_offsets = compute_line_offsets(change.text, false, start_offset)

			if end_line-start_line == added_line_offsets.len {
				len := added_line_offsets.len

				for i := 0; i < len; i++ {
					line_offsets[i + start_line + 1] = added_line_offsets[i]

					len = added_line_offsets.len
				}
			} else {
				if added_line_offsets.len < 10000 {
					line_offsets = line_offsets[start_line + 1, end_line - start_line]
				}
			}
		}
	}
}


fn (doc TextDocument) get_text(range Range) string {
	if range.start.line != -1 && range.end.line != -1 {
		start := doc.offset_at(range.start)
		end := doc.offset_at(range.end)

		return
	}
}

fn (doc TextDocument) position_at(offset int) Position {}
fn (doc TextDocument) offset_at(position Position) int {}
fn (doc mut TextDocument) update(changes []TextDocumentContentChangeEvent, version int) {
	for change of changes {
		if 
	}
}

