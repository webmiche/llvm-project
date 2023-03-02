#!/usr/bin/env python3

from pathlib import Path
import os
import functools
import operator
import subprocess

from multiprocessing import Process
from multiprocessing import Semaphore

ignored = [
#        "/home/nius/thesis/specbuilder/src/623/ASCIIRangeFactory.cpp",
#         "/home/nius/thesis/specbuilder/src/623/AbstractNumericFacetValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/AbstractNumericValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/AllContentModel.cpp",
# "/home/nius/thesis/specbuilder/src/623/AnySimpleTypeDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/AttrImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/AttrMapImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/AttrNSImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/Base64BinaryDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/Base64.cpp",
# "/home/nius/thesis/specbuilder/src/623/BinFileInputStream.cpp",
# "/home/nius/thesis/specbuilder/src/623/BinFileOutputStream.cpp",
# "/home/nius/thesis/specbuilder/src/623/BinMemInputStream.cpp",
# "/home/nius/thesis/specbuilder/src/623/BinMemOutputStream.cpp",
# "/home/nius/thesis/specbuilder/src/623/BitSet.cpp",
# "/home/nius/thesis/specbuilder/src/623/BlockRangeFactory.cpp",
# "/home/nius/thesis/specbuilder/src/623/BMPattern.cpp",
# "/home/nius/thesis/specbuilder/src/623/BooleanDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/CharacterDataImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/ChildNode.cpp",
# "/home/nius/thesis/specbuilder/src/623/CMAny.cpp",
# "/home/nius/thesis/specbuilder/src/623/ContentLeafNameTypeVector.cpp",
# "/home/nius/thesis/specbuilder/src/623/ContentSpecNode.cpp",
# "/home/nius/thesis/specbuilder/src/623/DatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/DatatypeValidatorFactory.cpp",
# "/home/nius/thesis/specbuilder/src/623/DateDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/DateTimeDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/DateTimeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/DecimalDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/DeepNodeListImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DocumentImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DocumentTypeImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMAttrMapImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMAttrNSImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMBuilderImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMCDATASectionImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMCharacterDataImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMChildNode.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMCommentImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMConfigurationImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMDeepNodeListImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_Document.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMDocumentImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMDocumentTypeImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_Element.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMElementImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMElementNSImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMEntityImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMErrorImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMImplementationImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMImplementationRegistry.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_NamedNodeMap.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNamedNodeMapImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_Node.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_NodeIterator.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNodeIteratorImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_NodeList.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNodeVector.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNotationImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMParentNode.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMParser.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMProcessingInstructionImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_Range.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMRangeImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMStringPool.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMTextImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOM_TreeWalker.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMTreeWalkerImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMWriterImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DoubleDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/DStringPool.cpp",
# "/home/nius/thesis/specbuilder/src/623/DTDAttDef.cpp",
# "/home/nius/thesis/specbuilder/src/623/DTDAttDefList.cpp",
# "/home/nius/thesis/specbuilder/src/623/DTDElementDecl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DTDEntityDecl.cpp",
# "/home/nius/thesis/specbuilder/src/623/ElementImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/ElementNSImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/ElemStack.cpp",
# "/home/nius/thesis/specbuilder/src/623/EncodingValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/ENTITYDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/FieldActivator.cpp",
# "/home/nius/thesis/specbuilder/src/623/FieldValueMap.cpp",
# "/home/nius/thesis/specbuilder/src/623/FloatDatatypeValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/GeneralAttributeCheck.cpp",
# "/home/nius/thesis/specbuilder/src/623/Grammar.cpp",
# "/home/nius/thesis/specbuilder/src/623/HexBin.cpp",
# "/home/nius/thesis/specbuilder/src/623/IC_Field.cpp",
# "/home/nius/thesis/specbuilder/src/623/IC_KeyRef.cpp",
# "/home/nius/thesis/specbuilder/src/623/AbstractDOMParser.cpp",
# "/home/nius/thesis/specbuilder/src/623/AbstractStringValidator.cpp",
# "/home/nius/thesis/specbuilder/src/623/CMBinaryOp.cpp",
# "/home/nius/thesis/specbuilder/src/623/CMUnaryOp.cpp",
# "/home/nius/thesis/specbuilder/src/623/ComplexTypeInfo.cpp",
# "/home/nius/thesis/specbuilder/src/623/DFAContentModel.cpp",
# "/home/nius/thesis/specbuilder/src/623/DGXMLScanner.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMAttrImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNormalizer.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMException.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNodeIDMap.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNodeImpl.cpp",
# "/home/nius/thesis/specbuilder/src/623/DOMNodeListImpl.cpp",




# "/home/nius/thesis/specbuilder/src/638/magick/prepress.c",
"/home/michel/ETH/AST/specbuilder/src/638/magick/quantize.c",


# "/home/nius/thesis/specbuilder/src/641/Random.cpp",
# "/home/nius/thesis/specbuilder/src/641/GTP.cpp",
# "/home/nius/thesis/specbuilder/src/641/FastBoard.cpp",
# "/home/nius/thesis/specbuilder/src/641/SGFTree.cpp",

    ]

def do_one(cmd, sema, target_source):

    # if str(target_source) in ignored or str(target_source).startswith("/home/nius/thesis/specbuilder/src/623/"):
    if str(target_source) in ignored:
        print("$$$BSC_IGNORE: " + str(target_source))
        sema.release()
        return

    os.system(cmd)
    with open(target_source, 'r+') as file:
        content = file.read()
        file.seek(0)
        file.write("#define BSC_INST_OFFSET_READ(expr, amt) *(char**)(((char*)&(expr)) + (amt))\n" + content)
    sema.release()

def main():
    PREFIX = "/home/michel/ETH/AST/specbuilder/"
    # preprocessed_source_dir = Path(PREFIX + "final_preprocessed_clang14")
    PREPROCESSED_DIR = "src"
    # AAVARS_DIR = "aavars"
    AAVARS_DIR = "aavars_with_offsets_onlyargs_2"
    aa_vars_dir = Path(PREFIX + AAVARS_DIR)
    i = 0
    curr_path = Path.cwd()
    os.chdir(PREFIX)
    processes=[]
    cores=100
    sema = Semaphore(cores)
    print(aa_vars_dir)
    for aa_var_file in aa_vars_dir.glob("**/*.aavars"):
        i = i + 1
        if i % 10 == 0:
            print(f"Done {i} files")
        # print(aa_var_file)
        without_aavars = os.path.splitext(aa_var_file)[0]
        without_ll = Path(without_aavars).with_suffix(".c")
        target_source = Path(without_ll.__str__().replace(AAVARS_DIR, PREPROCESSED_DIR, -1))
        suffixes = [".c", ".cpp", ".cxx", ".cc"]
        for suffix in suffixes:
            if target_source.with_suffix(suffix).exists():
                target_source = target_source.with_suffix(suffix)
                break
        if not target_source.exists():
            print("Could not find source file for " + aa_var_file.__str__())
            continue

        # print(without_ll)
        # print(target_source)

        # if not str(target_source).__contains__("619/lbm.c"):
        #     continue

        args = []
        with open(aa_var_file, "r") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                if not line.__contains__(":"):
                    continue
                if not line.split(":")[1]:
                    continue

                args.append(line)
        if args.__len__() == 0:
            print("No arguments found for " + aa_var_file.__str__())
            continue
        instrumenter = "/home/nius/thesis/llvm-project/clang-tools-extra/instrumenter/build/bin/clang-aa-instrumenter"
        arg = "--funcs-and-vars=" + " --funcs-and-vars=".join(args)
        # cmd = f"{instrumenter} -i -p build {target_source} --funcs-and-vars={arg}"
        cmd = f"{instrumenter} -i -p build {target_source} {arg}"
        print(cmd)
        # os.system(cmd)
        sema.acquire()
        p = Process(target=do_one, args=(cmd,sema, target_source))
        processes.append(p)
        p.start()
        # subprocess.Popen(cmd.split(" "))

    for p in processes:
        p.join()


    os.chdir(curr_path)
if __name__ == '__main__':
    main()

# target modified before starting instrument.py: 2022-07-25 11:46:50
