<div id="row">
    <div class="col-md-9 col-lg-12">
        <div class="box-shadow">

        <div class="table-head" style="height: 70px">
            <div class="col-md-6">
            Warning Setup
            </div>
            <div class="col-md-6">
                <?php echo form_open_multipart($form_action, $attributes); ?>
                <input type='submit' name='send' class='btn btn-primary' value='Add Row'/>
                <?php echo form_close(); ?>
            </div>
        </div>

        

        <div class="table-div responsive padding-top-xs">

            <table id="item_tbl" class="item_tbl table" cellspacing="0" cellpadding="0">
                <thead>

                    <th> No.</th>
                    <th> Global Warning Type</th>
                    <th> Customer</th>
                    <th> Threshold</th>

                    <th> <?=$this->lang->line('application_action');?></th>
                   
                </thead>
                <tbody>
                    <?php
                        $s_no=1;
                     foreach($warnings as $row){?>
                        
                        <tr>
                            <td><?=$s_no++;?></td>
                        <td>
                            <?php   
                            $attributes = array('class' => '', 'autocomplete' => 'off');
                            echo form_open_multipart($form_action, $attributes); 
                            ?>
                        <?=$row['type']?></td>
                        <td>
                        <?php if($row['type']=='Global Default setting for all customers'){
                            $readonly = "readonly";
                            $inputValue="All Customers";
                        }else{
                            $readonly = "";
                            $inputValue=$row['customer_num'];
                        }
                        ?>
                        <input <?php echo $readonly?> type="text" class="limit limit_box" name="customer_num"placeholder="Customer Number" value="<?php echo $inputValue ?>">
                     </td>
                        <td>
                            <input type="hidden" name="id" value="<?php echo $row['id'] ?>">
                            <input type="number" class="limit limit_box" name="threshold"placeholder="Threshold" value="<?php echo $row['threshold'] ?>">
                            
                        </td>
                        <td class="option" width="16%">
                        <input type='submit' name='send' class='btn btn-primary' value='Save'/>
                        <?php if($row['type']=='Customer specific setting'){?>
                        <input type='submit' name='send' class='btn btn-danger' value='Delete'/>
                        <?php } ?>
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

    var table = $('.item_tbl').DataTable( {
        orderCellsTop: true,
        fixedHeader: true,
        lengthMenu: [[10, 25, 50, 100,-1], [10, 25, 50,100, "All"]],
        pageLength: defaulnumberofpages,
        fixedHeader: true,
        // scrollCollapse: true,
        // scrollY:        "340px",
        // scrollX:        true,
        fixedHeader: {
            header: true,
            footer: true
        }
    } );
} )

</script>