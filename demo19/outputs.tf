output "for_directive" {  
   value = <<EOF
 %{ for name in var.user_names }  
  ${name}
 %{ endfor }
EOF
}
