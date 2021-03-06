$known_editors = "gvim", "vim", "nano", "notepad2", "notepad++", "notepad"

function editor {
    $editor = get_config 'editor'
    if ($editor) {
        return $editor
    }

    foreach($editor in $known_editors) {
        if (has_editor $editor) {
            return $editor
        }
    }

    return $null
}

function has_editor($name) {
    try { Get-Command $name -ErrorAction Stop; $true } catch { $false }
}
