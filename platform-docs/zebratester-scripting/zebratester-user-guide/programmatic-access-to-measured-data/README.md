# Programmatic Access to Measured Data

The ZebraTester Java API also contains classes and methods which allow direct access to all measured values stored within a statistics result file of a load test run (-prxres file).

### Usage & Examples <a href="#programmaticaccesstomeasureddata-usage-and-examples" id="programmaticaccesstomeasureddata-usage-and-examples"></a>

This enables you to create your own extracts and/or compilations from the measured data. The main entry point to access these data is the method `PerformanceData.readObjectFromFile(<result file name>)`.

### Extracting Performance Data <a href="#programmaticaccesstomeasureddata-extractingperformancedata" id="programmaticaccesstomeasureddata-extractingperformancedata"></a>

The following programming example extracts the most important performance data of the web pages and the URL calls.

#### Code <a href="#programmaticaccesstomeasureddata-code" id="programmaticaccesstomeasureddata-code"></a>

```
import java.io.*;
import dfischer.utils.PerformanceData;
import dfischer.utils.PerformanceDataRecord;


public class AnalyzeResult
{
  public static void main(String[] args)
  {
     try
     {
        // read result file from disk
        PerformanceData performanceData = new PerformanceData();
        performanceData.readObjectFromFile(args[0]);
        PerformanceDataRecord[] performanceDataRecord = performanceData.getPerformanceDataRecord();

        // display overall data
        System.out.println("users = " + performanceData.getParallelUsers());
        System.out.println("test duration = " + (performanceData.getTestDurationMillis() / 1000) + " seconds");
        System.out.println("hits per second = " + performanceData.getWebTransactionRate());
        System.out.println("passed loops = " + performanceData.getPassedLoops());
        System.out.println("failed loops = " + performanceData.getFailedLoops());
        System.out.println("average response time per page = " + ((float)performanceData.getAveragePageTime() / 1000.0f) + " seconds");
        System.out.println("average network connect time per URL call = " + performanceData.getAverageNetworkEstablishTime() + " milliseconds");

        System.out.println("");

        // display page data
        int[] pageBreakIndex = performanceData.getPageBreakIndexes();
        for (int x = 0; x < pageBreakIndex.length; x++)
        {
          String pageName = performanceDataRecord[pageBreakIndex[x]].getInfoText();
          long pageResponseTime = performanceData.getPageTime(pageBreakIndex[x]);

          // get all url calls per page
          int[] urlIndexesOfPage = performanceData.getValidUrlIndexesOfPage(pageBreakIndex[x]);

          // calculate average size of page
          long pageSize = 0;
          long pageTime = 0;
          long cumulatedPageSize = 0;
          for (int y = 0; y < urlIndexesOfPage.length; y++)
          {
             PerformanceDataRecord urlDataRecord = performanceDataRecord[urlIndexesOfPage[y]];
             pageSize = pageSize + urlDataRecord.getAverageSize();
             pageTime = pageTime + urlDataRecord.getAverageTime();
             cumulatedPageSize = cumulatedPageSize + urlDataRecord.getTotalSize();
          }

          System.out.println(pageName + "; size = " + pageSize + " bytes; time = " + ((float) pageTime / 1000.0f) + " seconds; total transmitted bytes over all calls = " + cumulatedPageSize);
        }


        System.out.println("");

        // loop over all measured url calls and page breaks
        for (int x = 0; x < performanceDataRecord.length; x++)
        {
          switch (performanceDataRecord[x].getDataType())
          {
             case PerformanceDataRecord.TYPE_PERFORMANCE_DATA:

                long urlSize = performanceDataRecord[x].getAverageSize();
                long urlTime = performanceDataRecord[x].getAverageTime();
                long cumulatedUrlSize = performanceDataRecord[x].getTotalSize();

                System.out.println(performanceDataRecord[x].getInfoText() + "; size = " + urlSize + " bytes; time = " + ((float) urlTime / 1000.0f) + " seconds; total transmitted bytes = " + cumulatedUrlSize);

                break;

             case PerformanceDataRecord.TYPE_PAGE_BREAK:
                System.out.println(performanceDataRecord[x].getInfoText());
                break;

             default:
                break;
          }
        }

     }
     catch (Exception e)
     {
        e.printStackTrace();
     }
  }
}
```

### Extracting Error Snapshots <a href="#programmaticaccesstomeasureddata-extractingerrorsnapshots" id="programmaticaccesstomeasureddata-extractingerrorsnapshots"></a>

The following programming example extracts all received content data of error snapshots taken (malformed web pages), and stores them in files so they can be displayed later in the web browser:

### Code <a href="#programmaticaccesstomeasureddata-code.1" id="programmaticaccesstomeasureddata-code.1"></a>

```
import java.io.FileOutputStream;
import dfischer.utils.PerformanceData;
import dfischer.utils.PerformanceDataRecord;
import dfischer.utils.PerformanceDataRecordFailureInfo;
import dfischer.utils.HttpTestURL;

/**
 * Writes the response content of all error snapshots to files if they contain ASCII (HTML,XML) data.
 * Program Argument: name of the result file (*.prxres).
 */
public class ExtractErrors
{
  public static void main(String[] args)
  {
    try
    {
      // read result file from disk
      PerformanceData performanceData = new PerformanceData();
      performanceData.readObjectFromFile(args[0]);

      // loop over all measured url calls and page breaks
      PerformanceDataRecord[] performanceDataRecord = performanceData.getPerformanceDataRecord();
      for (int x = 0; x < performanceDataRecord.length; x++)
      {
        switch (performanceDataRecord[x].getDataType())
        {
          case PerformanceDataRecord.TYPE_PERFORMANCE_DATA:

            // loop over all error snapshots per url call
            PerformanceDataRecordFailureInfo[] failureInfo = performanceDataRecord[x].getFailureInfo();
            for (int y = 0; y < failureInfo.length; y++)
            {
              // get data of failed url call
              HttpTestURL testURL = performanceDataRecord[x].getFailedUrl(failureInfo[y]);
              if (testURL != null)
              {
                // now we have access to all frozen url data
                String fileStartName = "url_" + x + "_error_" + (y + 1);

                // write response content to file - no binary data are written
                if (testURL.isAsciiContent())
                {
                  FileOutputStream fout = new FileOutputStream(fileStartName + "_response_content.html");
                  fout.write(testURL.getDecompressedContent());
                  fout.close();
                }
              }
            }
            break;
          case PerformanceDataRecord.TYPE_PAGE_BREAK:
            break;
          default:
            break;
        }
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

}
```
