echo'<div class="container  overflow-auto" style="height:250px; width: 450px ">
           
			 ' ;
	$x=1;
		foreach($result as $key => $row) {
			echo '<div class="col-sm-4" id='.$row["event_id"].' onclick("getTemplate(this.id)")>';
			echo '<li class=" d-flex justify-content-center" style="list-style: none; margin-bottom: 10px">';
			echo '<a>'.$row["event.name"].'</a>';
			echo '<br></li>';
			echo '</div>';
				if ($x ===3){
					echo ' <div class="w-100"></div>';
					$x=0;
				}
			$x = $x+1;
			}
		
	echo '
                                                    
                                       
                                    </div> <!-- End of container -->' ;

