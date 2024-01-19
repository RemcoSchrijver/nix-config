local fauxpilot = require('cmp_fauxpilot.config')

fauxpilot:setup({
    host = 'http://localhost:5000',
    model = 'fastertransformer',
    max_tokens = 1000,
    max_lines = 1000,
    max_num_results = 5,
    temperature = 0.7,
})
