using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using FBwithWA.Domain;

namespace FBwithWA.Web
{
    public class WebRole : RoleEntryPoint
    {
        public override bool OnStart()
        {
            RoleEnvironment.Changing += RoleEnvironmentChanging;
            
            //direct config to cloud config
            CloudStorageAccount.SetConfigurationSettingPublisher((configName, configSettingPublisher) =>
            {
                var connectionString = RoleEnvironment.GetConfigurationSettingValue(configName);
                configSettingPublisher(connectionString);
            });
            
            // set up azure storage
            AzureStorageInitializer.EnsureDomainObjectsExist();

            return base.OnStart();
        }

        private void RoleEnvironmentChanging(object sender, RoleEnvironmentChangingEventArgs e)
        {
            // If a configuration setting is changing
            if (e.Changes.Any(change => change is RoleEnvironmentConfigurationSettingChange))
            {
                // Set e.Cancel to true to restart this role instance
                e.Cancel = true;
            }
        }
    }
}