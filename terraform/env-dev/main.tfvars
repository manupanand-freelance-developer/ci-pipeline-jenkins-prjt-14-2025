
server={
    
        jenkins_controler={
            instance_type="t3a.large"
            root_disk=50
            policy_name=["AmazonEC2FullAccess","AmazonSSMFullAccess","AmazonS3ReadOnlyAccess"]
            port={
                    ssh=22
                    tcp=8080
                }
        }
        # jenkins_node_1={
        #     instance_type="t3a.large"
        # }
    
}
