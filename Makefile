program = ocaml_intro

weave:	$(program).twjr $(program).texi

texi:	$(program).texi

$(program).texi: $(program).twjr
	jrweave $(program).twjr > $(program).texi

info-open: info
	emacs $(program).info

info:	weave
	makeinfo $(program).texi

pdf-open: pdf
	open $(program).pdf

pdf:	$(program).twjr $(program).texi $(program).pdf

$(program).pdf: $(program).texi
	texi2pdf $(program).texi

tangle: $(program).twjr
	jrtangle $(program).twjr

clean:
	rm -f $(program).{aux,cd,cds,cr,crs,cp,cps,log,toc}

clean-all:      clean
	rm -f $(program).{pdf,info,texi}
	rm -f *.{c,ml}
