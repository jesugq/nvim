do
  local left = {
    fps = 60,
    name = 'left',
  }

  left.update = function (grid)
    for i = 1, #grid do
      local first = grid[i][1]
      for j = 1, #(grid[i]) - 1 do
        grid[i][j] = grid[i][j + 1]
      end
      grid[i][#(grid[i])] = first
    end
    return true
  end

  local cellular_automaton = require('cellular-automaton')
  cellular_automaton.register_animation(left)
end

do
  local down = {
    fps = 60,
    name = 'down',
  }

  down.update = function (grid)
    local num_rows = #grid
    local num_cols = #grid[1]

    for j = 1, num_cols do
      local bottom = grid[num_rows][j]
      for i = num_rows, 2, -1 do
        grid[i][j] = grid[i - 1][j]
      end
      grid[1][j] = bottom
    end
    return true
  end

  local cellular_automaton = require('cellular-automaton')
  cellular_automaton.register_animation(down)
end

do
  local up = {
    fps = 60,
    name = 'up',
  }

  up.update = function (grid)
    local num_rows = #grid
    local num_cols = #grid[1]

    for j = 1, num_cols do
      local top = grid[1][j]
      for i = 1, num_rows - 1 do
        grid[i][j] = grid[i + 1][j]
      end
      grid[num_rows][j] = top
    end
    return true
  end

  local cellular_automaton = require('cellular-automaton')
  cellular_automaton.register_animation(up)
end

do
  local right = {
    fps = 60,
    name = 'right',
  }

  right.update = function (grid)
    for i = 1, #grid do
      local prev = grid[i][#(grid[i])]
      for j = 1, #(grid[i]) do
        grid[i][j], prev = prev, grid[i][j]
      end
    end
    return true
  end

  local cellular_automaton = require('cellular-automaton')
  cellular_automaton.register_animation(right)
end

do
  local fall = {
    fps = 30,
    name = 'fall',
    side_noise = true,
    disperse_rate = 3,
  }

  local frame

  local cell_empty = function(grid, x, y)
    if x > 0 and x <= #grid and y > 0 and y <= #grid[x] and grid[x][y].char == " " then
      return true
    end
    return false
  end

  local swap_cells = function(grid, x1, y1, x2, y2)
    grid[x1][y1], grid[x2][y2] = grid[x2][y2], grid[x1][y1]
  end

  fall.init = function(grid)
    frame = 1
  end

  fall.update = function(grid)
    frame = frame + 1
    for i = 1, #grid, 1 do
      for j = 1, #grid[i] do
        grid[i][j].processed = false
      end
    end
    local was_state_updated = false
    for x0 = #grid - 1, 1, -1 do
      for i = 1, #grid[x0] do
       local y0
        if (frame + x0) % 2 == 0 then
          y0 = i
        else
          y0 = #grid[x0] + 1 - i
        end
        local cell = grid[x0][y0]

        if cell.processed == true then
          goto continue
        end

        cell.processed = true

        if fall.side_noise then
          local random = math.random()
          local side_step_probability = 0.05
          if random < side_step_probability then
            was_state_updated = true
            if cell_empty(grid, x0, y0 + 1) then
              swap_cells(grid, x0, y0, x0, y0 + 1)
            end
          elseif random < 2 * side_step_probability then
            was_state_updated = true
            if cell_empty(grid, x0, y0 - 1) then
              swap_cells(grid, x0, y0, x0, y0 - 1)
            end
          end
        end

        if cell_empty(grid, x0 + 1, y0) then
          swap_cells(grid, x0, y0, x0 + 1, y0)
          was_state_updated = true
        else
          local disperse_direction = cell.disperse_direction or ({ -1, 1 })[math.random(1, 2)]
          local last_pos = { x0, y0 }
          for d = 1, fall.disperse_rate do
            local y = y0 + disperse_direction * d
            if not cell_empty(grid, x0, y) then
              cell.disperse_direction = disperse_direction * -1
              break
            elseif last_pos[1] == x0 then
              swap_cells(grid, last_pos[1], last_pos[2], x0, y)
              was_state_updated = true
              last_pos = { x0, y }
            end
            if cell_empty(grid, x0 + 1, y) then
              swap_cells(grid, last_pos[1], last_pos[2], x0 + 1, y)
              was_state_updated = true
              last_pos = { x0 + 1, y }
            end
          end
        end
        ::continue::
      end
    end
    return was_state_updated
  end

  local cellular_automaton = require('cellular-automaton')
  cellular_automaton.register_animation(fall)
end

do
  local scram = {
    fps = 10,
    name = "scram",
  }

  local function is_alphanumeric(c)
    return c >= "a" and c <= "z" or c >= "A" and c <= "Z" or c >= "0" and c <= "9"
  end

  local scramble_word = function(word)
    local chars = {}
    while #word ~= 0 do
      local index = math.random(1, #word)
      table.insert(chars, word[index])
      table.remove(word, index)
    end
    return chars
  end

  scram.update = function(grid)
    for i = 1, #grid do
      local scrambled = {}
      local word = {}
      for j = 1, #grid[i] do
        local c = grid[i][j]
        if not is_alphanumeric(c.char) then
          if #word ~= 0 then
            for _, d in pairs(scramble_word(word)) do
              table.insert(scrambled, d)
            end
            word = {}
          end
          table.insert(scrambled, c)
        else
          table.insert(word, c)
        end
      end

      grid[i] = scrambled
    end
    return true
  end

  local cellular_automaton = require('cellular-automaton')
  cellular_automaton.register_animation(scram)
end

do
  local game = {
    fps = 15,
    name = "game",
    overpopultion_thr = 2,
    underpopulation_thr = 1,
    respawn_condition = 2,
  }

  local function is_cell_alive(grid, x, y)
    if x > 0 and x <= #grid and y > 0 and y <= #grid[x] and grid[x][y].char ~= " " then
      return true
    end
    return false
  end

  local function get_neighbours(grid, x, y)
    local neighbours = {}
    local coords = {
      { -1, 0 },
      { -1, -1 },
      { 0, -1 },
      { 1, -1 },
      { 1, 0 },
      { 1, 1 },
      { 0, 1 },
      { -1, 1 },
    }
    for _, n in ipairs(coords) do
      local nx = x + n[1]
      local ny = y + n[2]
      if is_cell_alive(grid, nx, ny) then
        table.insert(neighbours, grid[nx][ny])
      end
    end
    return neighbours
  end

  local function count_neighbours(grid, x, y)
    return #(get_neighbours(grid, x, y))
  end

  local function kill_cell(grid, x, y)
    grid[x][y] = { char = " " }
  end

  local function respawn_cell(grid, prev_grid, x, y)
    local neighbours = get_neighbours(prev_grid, x, y)
    grid[x][y] = vim.deepcopy(neighbours[math.random(1, #neighbours)])
  end

  game.update = function(grid)
    local reference = vim.deepcopy(grid)
    local was_state_updated = false
    for i = 1, #grid do
      for j = 1, #grid[i] do
        local n = count_neighbours(reference, i, j)
        if is_cell_alive(reference, i, j) then
          if n >= game.overpopultion_thr or n <= game.underpopulation_thr then
            kill_cell(grid, i, j)
            was_state_updated = true
          end
        else
          if n == game.respawn_condition then
            respawn_cell(grid, reference, i, j)
            was_state_updated = true
          end
        end
      end
    end
    return was_state_updated
  end

  local cellular_automaton = require('cellular-automaton')
  cellular_automaton.register_animation(game)
end

