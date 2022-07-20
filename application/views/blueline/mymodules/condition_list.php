<div id="row">
    <div class="col-md-9 col-lg-12">
        <div class="box-shadow">

            <div class="table-head" style="height: 70px">
                <div class="col-md-6">
                    Condition List
                </div>
                <div class="col-md-6">
                <?php echo form_open_multipart($form_action, $attributes); ?>
                    <input type='submit' name='send' class='btn btn-primary' value='Add Row'/>
                <?php echo form_close(); ?>
                </div>
            <!-- <div class="col-md-4">
                <a style="margin-top:30px" href="<?=site_url()?>item_setup/exportall" class="btn btn-primary pull-right" >
                            Export All
                        </a>
                    </div> -->
                </div>

                <div class="table-div responsive padding-top-xs">

                    <table id="item_tbl" class="item_tbl table" cellspacing="0" cellpadding="0">
                        <thead>

                            <th> No.</th>
                            <th> Warning Name</th>

                            <th>  Formula</th>

                            <th> <?=$this->lang->line('application_action');?></th>
                        </thead>
                        <tbody>
                            <?php
                            $s_no=1;
                            foreach($warning_condition as $row){?>

                                <tr>
                                    <td><?=$s_no++;?></td>
                                    <td>
                                        <?php   
                                        $attributes = array('class' => '', 'autocomplete' => 'off');
                                        echo form_open_multipart($form_action, $attributes); 
                                        ?>
                                        <input type="hidden" name="id" value="<?php echo $row['id'] ?>">
                                        <input type="text" name="formula_name" value="<?=$row['formula_name']?>">
                                    </td>
                                    <td>
                                        <textarea style="width: 293px; height: 89px;" name="formula_value"><?=$row['formula_value']?></textarea>
                                    </td>
                                    <td class="option" width="16%">
                                        <input type='submit' name='send' class='btn btn-primary' value='Save'/>
                                        <input type='submit' name='send' class='btn btn-danger' value='Delete'/>
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