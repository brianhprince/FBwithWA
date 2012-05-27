<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="FBwithWA.Cloud" generation="1" functional="0" release="0" Id="95fa1438-338f-4754-a79b-df3ebdbc79bc" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="FBwithWA.CloudGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/LB:FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inToChannel>
        </inPort>
        <inPort name="FBwithWA.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/LB:FBwithWA.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Certificate|FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapCertificate|FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </maps>
        </aCS>
        <aCS name="Certificate|FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapCertificate|FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:QueuePollingIntervalCeiling" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:QueuePollingIntervalCeiling" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessing:QueuePollingIntervalFloor" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessing:QueuePollingIntervalFloor" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.BackendProcessingInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.BackendProcessingInstances" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.Web:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.Web:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </maps>
        </aCS>
        <aCS name="FBwithWA.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/MapFBwithWA.WebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput">
          <toPorts>
            <inPortMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:FBwithWA.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
        <sFSwitchChannel name="SW:FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp">
          <toPorts>
            <inPortMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
          </toPorts>
        </sFSwitchChannel>
        <sFSwitchChannel name="SW:FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp">
          <toPorts>
            <inPortMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
          </toPorts>
        </sFSwitchChannel>
      </channels>
      <maps>
        <map name="MapCertificate|FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" kind="Identity">
          <certificate>
            <certificateMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </certificate>
        </map>
        <map name="MapCertificate|FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" kind="Identity">
          <certificate>
            <certificateMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </certificate>
        </map>
        <map name="MapFBwithWA.BackendProcessing:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/DataConnectionString" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessing:QueuePollingIntervalCeiling" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/QueuePollingIntervalCeiling" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessing:QueuePollingIntervalFloor" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/QueuePollingIntervalFloor" />
          </setting>
        </map>
        <map name="MapFBwithWA.BackendProcessingInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessingInstances" />
          </setting>
        </map>
        <map name="MapFBwithWA.Web:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/DataConnectionString" />
          </setting>
        </map>
        <map name="MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </setting>
        </map>
        <map name="MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </setting>
        </map>
        <map name="MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </setting>
        </map>
        <map name="MapFBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </setting>
        </map>
        <map name="MapFBwithWA.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.WebInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="FBwithWA.BackendProcessing" generation="1" functional="0" release="0" software="C:\Users\brian\Documents\Projects\FBwithWA\FBwithWA.Cloud\csx\Debug\roles\FBwithWA.BackendProcessing" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="1792" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp" />
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp" portRanges="3389" />
              <outPort name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/SW:FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
              <outPort name="FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/SW:FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="" />
              <aCS name="QueuePollingIntervalCeiling" defaultValue="" />
              <aCS name="QueuePollingIntervalFloor" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;FBwithWA.BackendProcessing&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;FBwithWA.BackendProcessing&quot;&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;FBwithWA.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessingInstances" />
            <sCSPolicyFaultDomainMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessingFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="FBwithWA.Web" generation="1" functional="0" release="0" software="C:\Users\brian\Documents\Projects\FBwithWA\FBwithWA.Cloud\csx\Debug\roles\FBwithWA.Web" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp" portRanges="3389" />
              <outPort name="FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/SW:FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
              <outPort name="FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/SW:FBwithWA.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;FBwithWA.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;FBwithWA.BackendProcessing&quot;&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;FBwithWA.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.WebInstances" />
            <sCSPolicyFaultDomainMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="FBwithWA.BackendProcessingFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="FBwithWA.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="FBwithWA.BackendProcessingInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="FBwithWA.WebInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="e5b5b72d-68d4-4795-ace8-e88dff5822b8" ref="Microsoft.RedDog.Contract\ServiceContract\FBwithWA.CloudContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="2645dad5-36a0-4f48-8cca-c182b396233c" ref="Microsoft.RedDog.Contract\Interface\FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.BackendProcessing:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="a740d1a6-0cd9-4a41-8ea6-27e7a856e6f1" ref="Microsoft.RedDog.Contract\Interface\FBwithWA.Web:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/FBwithWA.Cloud/FBwithWA.CloudGroup/FBwithWA.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>