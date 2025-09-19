# Extracting Performance Data

The following programming example extracts the most important performance data of the web pages and the URL calls.

#### Code <a href="#extractingperformancedata-code" id="extractingperformancedata-code"></a>

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
