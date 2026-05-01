resource "aws_iam_role" "eks_admin" {
  name = "eks-admin-${var.environment}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Condition = {}
        Principal = {
          AWS = var.admin_principal_arns
        }
      }
    ]
  })

  tags = {
    Name = "eks-admin-${var.environment}-role"
  }

}

resource "aws_eks_access_entry" "eks-admin" {
  cluster_name = var.cluster_name
  principal_arn = aws_iam_role.eks_admin.arn
  type = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks-access-policy" {
  cluster_name  = var.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = aws_iam_role.eks_admin.arn

  access_scope {
    type       = "cluster"
  }

  depends_on = [ aws_eks_access_entry.eks-admin ]
}