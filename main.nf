#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {

  publishDir = [
        path: { "${params.outdir}/${task.process.tokenize(':')[-1].tokenize('_')[0].toLowerCase()}" },
        mode: "copy"
    ]

  input: 
    val x
  output:
    val "ziad_report1", emit: no_ext
    val "ziad_report2.txt", emit: with_ext

  script:
    """
    echo '$x world!' > ziad_report1
    echo '$x world!' > ziad_report2.txt

    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
