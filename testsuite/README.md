# Test suites for the standard GF grammars

## miniresource.txt

examples:

--the woman is green
UseCl Pres Pos (PredVP (DetCN the_Det (UseN woman_N)) (CompAP (UseA green_A)))

--I have arrived
UseCl Perf Pos (PredVP i_NP (UseV arrive_V))


## resource.txt

like mini but more


## wide-coverage.txt

--he transplanted the cell by publishing the document
ChunkPhr (OneChunk (S_Chunk (UseCl (TTAnt TPast ASimul) PPos (PredVP (UsePron he_Pron) (AdvVP (ComplV2 transplant_V2 (DetCN (DetQuant DefArt NumSg) (UseN cell_N))) (ByVP (ComplV2 publish_V2 (DetCN (DetQuant DefArt NumSg) (UseN document_N)))))))))


## german-disco.txt

Sentences extracted from the TIGER, see http://cl.indiana.edu/~skuebler/papers/disco.pdf