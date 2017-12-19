echo "Packaging Bundle..."
packageNum=`./testRabbitMQClient.php apiPackage-v | xargs`
	echo "test...."
	mkdir temp/
	apiScrDIR=$HOME/rabbitmqphp_example/
		cp -a $apiScrDIR* temp/
	tar -czvf apiPackage-v"$packageNum".tar.gz -C temp/ . 
	rm -r temp
        echo `ls | grep apiPackage-v"$packageNum"`
		echo "Bundle Complete"
	# Scp package to the deploy server
	echo "Sending to deploy server..."
	scp -r apiPackage-v"$packageNum".tar.gz kevv@192.168.1.13:/home/kevv/git/it490Deploy/packages/	
	cp apiPackage-v"$packageNum".tar.gz apiPackages/
	rm apiPackage-v"$packageNum".tar.gz
	php updatePackage.php apiPackage-v"$packageNum".tar.gz "$packageNum"
	echo "Packaging Complete! Sent to Deployment Server."

