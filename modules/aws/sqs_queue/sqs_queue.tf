resource "aws_sqs_queue" "queue" {
  delay_seconds "${var.delay_seconds}"
  fifo_queue  = "${var.fifo_queue}"
  name        = "${var.name}" 
}
