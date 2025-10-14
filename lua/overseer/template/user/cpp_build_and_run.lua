return {
  name = 'Build and Run C++',
  builder = function()
    return {
      cmd = 'sh',
      args = { '-c', 'cmake --build build && ./build/my_app' },
      components = { 'default' },
    }
  end,
  condition = {
    filetype = { 'cpp' },
  },
}
