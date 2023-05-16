#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {

  

  input: 
    val x
  output:
    path "ziad_report1", emit: no_ext
    path "ziad_report2.txt", emit: with_ext

  script:
    """
    echo '$x world!' > ziad_report1
    echo '$x world!' > ziad_report2.txt

    """
}

workflow {
  Channel.of('Hola') | sayHello 
}
