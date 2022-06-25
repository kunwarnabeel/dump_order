<style>
    @media (max-width: 767px){
        .content-area {padding: 0;}
        .row.mainnavbar {
            margin-bottom: 0px;
            margin-right: 0px;
        }
    }
</style>

<div class="grid">
    <div class="grid__col-md-10 dashboard-header">
        <h1>
            Hi Administrator, Welcome back to Dump Order Portal!
        </h1>
    </div>    
    <div class="grid__col-md-2 dashboard-header hidden-xs">
    </div>
    <div class="grid__col-sm-12 grid__col-md-12 grid__col-lg-12 grid__col--bleed">
        <div class="grid grid--align-content-start">
            <div class="grid__col-12 update-panel">
                <div class="tile-base box-shadow">
                </div>
            </div>
            <!-- This section will be visible to Administrator -->
            <div class="grid__col-4 grid__col-xs-4 grid__col-sm-4 grid__col-md-4 grid__col-lg-4">
                <div class="tile-base box-shadow">
                    <div class="tile-icon hidden-md hidden-xs"><i class="ion-ios-cloud-upload"></i>
                    </div>
                    <div class="tile-small-header">Open Order Import</div>
                    <div class="tile-body">
                        <a href = "<?=site_url('OpenOrder/import_data')?>" class="btn btn-primary">Import</a>
                    </div>
                    <div class="tile-bottom">
                        <div class="progress tile-progress tile-progress--orange">

                        </div>
                    </div>
                </div>
            </div>

            <div class="grid__col-4 grid__col-xs-4 grid__col-sm-4 grid__col-md-4 grid__col-lg-4">
                <div class="tile-base box-shadow">
                    <div class="tile-icon hidden-md hidden-xs"><i class="ion-ios-cloud-upload"></i>
                    </div>
                    <div class="tile-small-header">Sales Plan Import</div>
                    <div class="tile-body">
                    <a href = "<?=site_url('SalesOrder/import_data')?>" class="btn btn-primary">Import</a>
                    </div>
                    <div class="tile-bottom">
                        <div class="progress tile-progress tile-progress--orange">

                        </div>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>