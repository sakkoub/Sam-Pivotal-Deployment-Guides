output "concourse_lb_target_groups" {
  value = [
    "${aws_lb_target_group.concourse_lb_80.name}",
    "${aws_lb_target_group.concourse_lb_443.name}",
    "${aws_lb_target_group.concourse_lb_2222.name}",
    "${aws_lb_target_group.concourse_lb_8443.name}",
    "${aws_lb_target_group.concourse_lb_8844.name}"
  ]
}
