# Extracting Error Snapshots

The following programming example extracts all received content data of error snapshots taken (malformed web pages), and stores them in files so they can be displayed later in the web browser:

### Code <a href="#extractingerrorsnapshots-code" id="extractingerrorsnapshots-code"></a>

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
