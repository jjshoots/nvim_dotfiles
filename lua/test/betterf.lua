vim.api.nvim_command("highlight betterFHighlightGroup guifg=#ff0000")

local function findInstancesAndReplace(buf_num, ns_id, cursor_row_num, cursor_col_num, match_char)
    -- list of characters that we will use to index things
    local index_char_num = 1
    local index_chars = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",";",}

    -- dictionary of index_char: {row_num, col_num}
    local index_char_match = {}

    -- list of {row_num, col_num}
    local originals = {}

    -- loop through each row in the buffer
    local row_num = cursor_row_num
    while row_num <= vim.fn.line("w$") do
        -- get the content of the row
        local row_content = vim.fn.getline(row_num)

        -- if we are on the current line, only get from the current cursor position
        local offset = 0
        if row_num == cursor_row_num then
            row_content = string.sub(row_content, cursor_col_num+1, -1)
            offset = cursor_col_num
        end

        -- find all instances of our character in the current sentence
        for col_num = 1, #row_content do
            local char = string.sub(row_content, col_num, col_num)

            -- if match, add the match to our list, and overlay the character with the index
            if char == match_char then
                local opts = {
                    virt_text = {{index_chars[index_char_num], "betterFHighlightGroup"}},
                    virt_text_pos = "overlay",
                }
                vim.api.nvim_buf_set_extmark(buf_num, ns_id, row_num-1, col_num+offset-1, opts)
                table.insert(originals, {row_num, col_num+offset-1})
                if index_char_num < #index_chars then
                    -- increment as long as we haven't reached the end
                    index_char_match[index_chars[index_char_num]] = {row_num, col_num+offset}
                    index_char_num = index_char_num + 1
                end
            end
        end
        -- increment row number
        row_num = row_num + 1
    end

    return index_char_match
end

function betterF()
    -- grab the target character, current line, current column, buffer number, and create a namespace
    local match_char = vim.fn.getcharstr()
    local cursor_row_num, cursor_col_num = vim.fn.line("."), vim.fn.col(".")
    local buf_num = vim.fn.bufnr()
    local ns_id = vim.api.nvim_create_namespace("betterF")

    -- find all instances, edit the texts
    -- get all matches, this is a dictionary of index_char: {row_num, col_num}
    local index_char_match = findInstancesAndReplace(buf_num, ns_id, cursor_row_num, cursor_col_num, match_char)

    -- force a redraw before the function completes
    vim.schedule(function()
        vim.cmd("redraw!")
    end)

    -- get the user's requested jump location
    local jump_index = vim.fn.getchar()
    if jump_index ~= 27 then
        if index_char_match[vim.fn.nr2char(jump_index)] then
            local jump_location = index_char_match[vim.fn.nr2char(jump_index)]
            vim.api.nvim_win_set_cursor({0}, {jump_location[1], jump_location[2]-1})
        end
    end

    -- clear the namespace for virtual text
    vim.api.nvim_buf_clear_namespace(buf_num, ns_id, 0, -1)
end

-- Map a key to trigger the function (you can customize this key)
vim.api.nvim_set_keymap('n', '<Leader>f', [[:lua betterF()<CR>]], { noremap = true, silent = true })
