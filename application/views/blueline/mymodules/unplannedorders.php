<div id="row">
    <div class="col-md-9 col-lg-12">
        <div class="box-shadow">

        <div class="table-head" style="height: 70px">
            <div class="col-md-10">
            Unplanned Orders
            </div>
           <!-- <div class="col-md-2">
                <a style="margin-top:10px" href="<?=site_url()?>warnings/export_all" class="btn btn-primary" >
                            Export All
                        </a>
            </div>-->
        </div>

        <div class="table-div responsive padding-top-xs">

            <table id="item_tbl" class="item_tbl table table-bordered table-striped table-hover" cellspacing="0" cellpadding="0">
                <thead>
                    <th> Date</th>
                    <th> Org ID</th>
                    <th> Name</th>
                    <th> Account No.</th>
                    <th> Part No.</th>
                    <th> Description</th>
                    <th> Due Date</th>
                    <th> Total Quantity</th>
                   
                </thead>
                <tbody>
                    <?php foreach($unplannedorders as $row){?>
                        <tr>
                        <td>
                            
                            <?php echo $row['date']?></td>
                        
                        <td><?php echo $row['org_id']?></td>
                        <td><?php echo $row['name']?></td>
                        <td><?php echo $row['account_id']?></td>
                        <td><?php echo $row['part_number']?></td>
                        <td><?php echo $row['description']?></td>
                        <td><?php echo $row['due_date']?></td>
                        <td><?php echo $row['total_qty']?></td>
                        
                       
                        </tr>
                        <?php }?>                    
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    $(window).load(function() {
        $(".loader").fadeOut("slow");
    });
    $(document).ready(function() {
        $('.stc_status').on('click',function(e){
            if ($(this).is(':checked')) {
                $(this).closest('td').find('.status_val').val('Closed');                
            }
            else{
                    $(this).closest('td').find('.status_val').val('Open');
            }
        })
    $('.item_tbl thead tr').clone(true).appendTo( '.item_tbl thead' );
    $('.item_tbl thead tr:eq(1) th').each( function (i) {
        var title = $(this).text();

        if(title.trim()!="Action")
        {
            $(this).html('<input type="text" class="    " placeholder="Search" />');
        }else{
            $(this).html('');
        }
     
            $('input', this ).on('keyup change', function () {
                if ( table.column(i).search() !== this.value ) {
                    table
                        .column(i)
                        .search( this.value )
                        .draw();
                }
                $('#search_item_btn').attr('disabled','') ;              
            } );

    } );

    var table = $('.item_tbl').DataTable( {
        orderCellsTop: true,
        fixedHeader: true,
        lengthMenu: [[10, 25, 50, 100,-1], [10, 25, 50,100, "All"]],
        pageLength: defaulnumberofpages,
        fixedHeader: true,
        fixedHeader: {
            header: true,
            footer: true
        }
    } );

    $('#search_item_btn').on('click',function(){
        table.draw();
        console.log(tableData)
    })
} )

</script>