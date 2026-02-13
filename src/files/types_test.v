module files

fn test_detect_file_type_returns_json_for_json_extension() {
	assert detect_file_type('json') == FileType.json
}

fn test_detect_file_type_returns_yaml_for_yaml_extension() {
	assert detect_file_type('yaml') == FileType.yaml
}

fn test_detect_file_type_returns_yaml_for_yml_extension() {
	assert detect_file_type('yml') == FileType.yaml
}

fn test_detect_file_type_returns_toml_for_toml_extension() {
	assert detect_file_type('toml') == FileType.toml
}

fn test_detect_file_type_returns_xml_for_xml_extension() {
	assert detect_file_type('xml') == FileType.xml
}

fn test_detect_file_type_returns_unknown_for_unrecognized_extension() {
	assert detect_file_type('txt') == FileType.unknown
	assert detect_file_type('csv') == FileType.unknown
	assert detect_file_type('') == FileType.unknown
}

fn test_detect_file_type_from_extension_extracts_json_from_filename() {
	assert detect_file_type_from_extension('config.json') == FileType.json
}

fn test_detect_file_type_from_extension_extracts_yaml_from_filename() {
	assert detect_file_type_from_extension('config.yaml') == FileType.yaml
	assert detect_file_type_from_extension('config.yml') == FileType.yaml
}

fn test_detect_file_type_from_extension_extracts_toml_from_filename() {
	assert detect_file_type_from_extension('config.toml') == FileType.toml
}

fn test_detect_file_type_from_extension_extracts_xml_from_filename() {
	assert detect_file_type_from_extension('config.xml') == FileType.xml
}

fn test_detect_file_type_from_extension_handles_uppercase_extensions() {
	assert detect_file_type_from_extension('config.JSON') == FileType.json
	assert detect_file_type_from_extension('config.YAML') == FileType.yaml
	assert detect_file_type_from_extension('config.TOML') == FileType.toml
	assert detect_file_type_from_extension('config.XML') == FileType.xml
}

fn test_detect_file_type_from_extension_handles_mixed_case_extensions() {
	assert detect_file_type_from_extension('config.Json') == FileType.json
	assert detect_file_type_from_extension('config.YaML') == FileType.yaml
}

fn test_detect_file_type_from_extension_handles_multiple_dots_in_filename() {
	assert detect_file_type_from_extension('my.config.file.json') == FileType.json
	assert detect_file_type_from_extension('app.data.yaml') == FileType.yaml
}

fn test_detect_file_type_from_extension_returns_unknown_for_unrecognized_extension() {
	assert detect_file_type_from_extension('readme.txt') == FileType.unknown
	assert detect_file_type_from_extension('data.csv') == FileType.unknown
}

fn test_detect_file_type_from_content_detects_json_object() {
	assert detect_file_type_from_content('{"key": "value"}') == FileType.json
}

fn test_detect_file_type_from_content_detects_json_with_whitespace() {
	assert detect_file_type_from_content('  { "key": "value" }  ') == FileType.json
}

fn test_detect_file_type_from_content_detects_yaml_with_key_value_pairs() {
	content := 'key: value\nother: data'
	assert detect_file_type_from_content(content) == FileType.yaml
}

fn test_detect_file_type_from_content_detects_yaml_with_list_items() {
	content := '- item1\n- item2'
	assert detect_file_type_from_content(content) == FileType.yaml
}

fn test_detect_file_type_from_content_detects_toml() {
	content := 'key = "value"\nother = 123'
	assert detect_file_type_from_content(content) == FileType.toml
}

fn test_detect_file_type_from_content_detects_xml() {
	assert detect_file_type_from_content('<root></root>') == FileType.xml
}

fn test_detect_file_type_from_content_detects_xml_with_whitespace() {
	assert detect_file_type_from_content('  <root></root>  ') == FileType.xml
}

fn test_detect_file_type_from_content_returns_unknown_for_empty_string() {
	assert detect_file_type_from_content('') == FileType.unknown
}

fn test_detect_file_type_from_content_returns_unknown_for_whitespace_only() {
	assert detect_file_type_from_content('   \n\t  ') == FileType.unknown
}

fn test_detect_file_type_from_content_returns_unknown_for_plain_text() {
	assert detect_file_type_from_content('just some plain text') == FileType.unknown
}

fn test_detect_file_type_from_content_returns_unknown_for_single_line_without_markers() {
	assert detect_file_type_from_content('hello world') == FileType.unknown
}
