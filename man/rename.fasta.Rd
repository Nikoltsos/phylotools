\name{rename.fasta}
\alias{rename.fasta}

\title{
Rename the sequences for a fasta file
}
\description{
Rename the sequences within a fasta file according to a data frame supplied.
}
\usage{
rename.fasta(infile = NULL, ref_table, outfile = "renamed.fasta")
}

\arguments{
  \item{infile}{
character string containing the name of the fasta file.
}
  \item{ref_table}{
a data frame with first column for original name, second column for the new name of the sequence.
}
  \item{outfile}{
The name of the fasta file with sequences renamed.
}
}
\details{
If the orginal name was not found in the ref_table, the name for the sequence will be changed into "old_name_" + orginal name.
}
\value{
This is a subroutine without return value.
}
\references{
\url{http://www.genomatix.de/online_help/help/sequence_formats.html}
}
\author{
Jinlong Zhang <jinlongzhang01@gmail.com>
}
\note{
Since whitespace and punctuation characters will be replaced with "_",  name of a sequence might change. It is suggest to obtain the name of the sequences by calling read.fasta first, and save the data.frame to a csv file to obtain the "original" name for the sequences.
}

\seealso{
\code{\link{read.fasta}}, \code{\link{split_dat}}
}
\examples{

cat(
    ">seq_1",  "--TTACAAATTGACTTATTATA",
    ">seq_2",  "GATTACAAATTGACTTATTATA",
    ">seq_3",  "GATTACAAATTGACTTATTATA",
    ">seq_5",  "GATTACAAATTGACTTATTATA",
    ">seq_8",  "GATTACAAATTGACTTATTATA",
    ">seq_10", "---TACAAATTGAATTATTATA",
    file = "matk.fasta", sep = "\n")
old_name <- get.fasta.name("matk.fasta")
new_name <- c("Magnolia", "Ranunculus", "Carex", "Morus", "Ulmus", "Salix")
ref2 <- data.frame(old_name, new_name)
rename.fasta(infile = "matk.fasta", ref_table = ref2, outfile = "renamed.fasta")
unlink("matk.fasta")
unlink("renamed.fasta")
}

\keyword{ fasta }
