<div id="row">
    <div class="col-md-9 col-lg-12">
        <div class="box-shadow">

        <div class="table-head" style="height: 70px">
            <div class="col-md-10">
            Warning Log
            </div>
            <!--<div class="col-md-2">
                <a style="margin-top:10px" href="<?=site_url()?>warnings/export_all" class="btn btn-primary" >
                            Export All
                        </a>
            </div>-->
        </div>

        <div class="table-div responsive padding-top-xs">

            <table id="item_tbl" class="item_tbl table" cellspacing="0" cellpadding="0">
                <thead>
                    <th> Date</th>
                    <th> Customer</th>
                    <th> Account No.</th>
                    <th> SWS Part No.</th>
                    <th> Description</th>
                    <th> Warning</th>
                    <!--<th> Index</th>-->
                    <th> User Notes</th>
                    <th> <?=$this->lang->line('application_action');?></th>
                </thead>
                <tbody>
                    <?php foreach($warnings as $row){?>
                        <tr>
                        <td>
                            <?php   
                            $attributes = array('class' => '', 'autocomplete' => 'off');
                            echo form_open_multipart($form_action, $attributes); 
                            ?>
                            <?php echo $row['log_date']?></td>
                        
                        <td><?php echo $row['customer_name']?></td>
                        <td><?php echo $row['account_number']?></td>
                        <td><?php echo $row['part_num']?></td>
                        <td><?php echo $row['description']?></td>
                        <td><?php echo $row['warning']?></td>
                        <!--<td><?php echo $row['tolerance']?></td>-->
                        <td><input type="hidden" name="id" value="<?php echo $row['id'] ?>">
                            <textarea rows="3" cols="50" class="limit limit_box" name="user_notes" placeholder="User Notes"><?php echo $row['user_notes'] ?></textarea></td>
                        <td class="option" width="8%">
                                    <input class="status_val" type="hidden" name="status" value="<?=$row['status'];?>"/>
                                <input class="stc_status" type="checkbox" data-toggle="toggle" 
                                <?php
                                if($row['status'] == 'Closed')
                                    echo 'checked'.' disabled';
                                ?>
                                 data-size="mini"/>
                         <input type='submit' <?php
                                if($row['status'] == 'Closed')
                                    echo 'disabled';
                                ?>  name='send' class='btn btn-primary' value='Save'/>
                        <?php echo form_close(); ?>
                    </td>
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