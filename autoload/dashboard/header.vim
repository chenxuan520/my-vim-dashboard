let s:header_default=[
			\'',
			\'',
			\'███████╗██╗  ██╗███████╗███╗   ██╗██╗███████╗ ██╗   ██╗ ██╗ ███╗   ███╗',
			\'██╔════╝██║  ██║██╔════╝████╗  ██║ █║██╔════╝ ██║   ██║ ██║ ████╗ ████║',
			\'██║     ███████║█████╗  ██╔██╗ ██║ ╚╝███████╗ ██║   ██║ ██║ ██╔████╔██║',
			\'██║     ██╔══██║██╔══╝  ██║╚██╗██║   ╚════██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
			\'███████╗██║  ██║███████╗██║ ╚████║   ███████║  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
			\'╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝   ╚══════╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
			\'                    🎉 Have a good time to code! 🎊',
			\]
function! dashboard#header#get_header()
	return s:header_default
endfunction
